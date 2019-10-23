class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end
  
  def index
    @menus = Menu.all.order(created_at: :desc)
  end
  
  def create
    @menu = Menu.new(menu_params)
    
    if @menu.save
      redirect_to menus_path, success: "トレーニングメニューを作成しました"
    else
      flash.now[:danger] = "メニュー作成に失敗しました"
      render :new
    end
  end
  
  def destroy
  end

  def edit
  end
  
  private
  def menu_params
    params.require(:menu).permit(:part, :training, :weight, :rep, :set, :comment)
  end

end
