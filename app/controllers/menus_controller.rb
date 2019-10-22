class MenusController < ApplicationController
  def new
    
  end
  
  def index
    @menus = Menu.all
  end
  
  def destroy
  end

  def edit
  end
end
