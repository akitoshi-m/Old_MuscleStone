class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
    
  def create
    @user = User.new(user_params, image_name: "default-user.jpeg")
    if @user.save
      redirect_to root_path, success: '登録ができました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'ユーザー編集が完了しました'
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
