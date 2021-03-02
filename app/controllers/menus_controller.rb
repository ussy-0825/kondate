class MenusController < ApplicationController
  before_action :authenticate_user!,  except:[:index]
  before_action :access_check, only:[:edit, :update]

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
  params.require(:menu).permit(:cook_date, recipe_ids:[]).merge(user_id: current_user.id)
  end

  def create_menu
    dish = @menu.recipe_ids
    main_name = Recipe.where(id: dish.first).pluck(:cooking_name)
    @menu[:main] = main_name[0]
    sub_one_name = Recipe.where(id: dish.second).pluck(:cooking_name)
    @menu[:sub_one] = sub_one_name[0]
    sub_two_name = Recipe.where(id: dish.third).pluck(:cooking_name)
    @menu[:sub_two] = sub_two_name[0]
    soup_name = Recipe.where(id: dish.fourth).pluck(:cooking_name)
    @menu[:soup] = soup_name[0]
  end

  def access_check
    author = Recipe.find(params[:id])
    if current_user.id != author.user_id
      redirect_to root_path
    end
  end

end
