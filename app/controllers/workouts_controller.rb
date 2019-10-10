class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
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
