class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end
  
  def create
    @workout = current_user.workouts.new(workout_params)
    
    if @workout.save
      redirect_to workouts_path, success: "投稿に成功しました"
    else
      flash.new[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def workout_params
    params.require(:workout).permit(:image, :description)
  end
end
