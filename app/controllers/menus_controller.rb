class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(cook_date_params)
    main_name = Recipe.where('side_dishes_id = 2').where( 'id >= ?',rand(Recipe.first.id..Recipe.last.id) ).first
    @menu["main"] = main_name.cooking_name
    sub_one_name = Recipe.where('side_dishes_id = 3').where( 'id >= ?',rand(Recipe.first.id..Recipe.last.id) ).first
    @menu["sub_one"] = sub_one_name.cooking_name
    sub_two_name = Recipe.where('side_dishes_id = 3').where( 'id >= ?',rand(Recipe.first.id..Recipe.last.id) ).first
    @menu["sub_two"] = sub_two_name.cooking_name
    soup_name = Recipe.where('side_dishes_id = 4').where( 'id >= ?',rand(Recipe.first.id..Recipe.last.id) ).first
    @menu["soup"] = soup_name.cooking_name
    @menu.save
  end

  private
  def cook_date_params
  params.require(:menu).permit(:cook_date)
  end

end
