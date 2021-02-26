class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(cook_date_params)
    create_menu
    if @menu.save
      redirect_to root_path
    else
      render :create
    end
  end

  private
  
  def cook_date_params
  params.require(:menu).permit(:cook_date).merge(user_id: current_user.id)
  end

  def create_menu
    main_name = Recipe.where(side_dishes_id: 2).pluck(:cooking_name)
    @menu["main"] = main_name.sample
    sub_one_name = Recipe.where(side_dishes_id: 3).pluck(:cooking_name)
    @menu["sub_one"] = sub_one_name.sample
    sub_two_name = Recipe.where(side_dishes_id: 3).pluck(:cooking_name)
    @menu["sub_two"] = sub_two_name.sample
    soup_name = Recipe.where(side_dishes_id: 4).pluck(:cooking_name)
    @menu["soup"] = soup_name.sample
  end
end
