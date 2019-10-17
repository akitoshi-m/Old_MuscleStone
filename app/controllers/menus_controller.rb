class MenusController < ApplicationController
  def new
    
  end
  
  def index
    @menus = Menu.all
  end
end
