class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all.includes(:like_users)
    #指定したモデルのデータを一括で取得しキャッシュしておく
  end

  def new
    @workout = Workout.new
  end
  
  def show
  end
  
  def create
    @workout = current_user.workouts.new(workout_params)
    
    if @workout.save
      redirect_to workouts_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def workout_params
    params.require(:workout).permit(:image, :description)
  end
end
