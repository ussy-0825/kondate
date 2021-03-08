class RecipesController < ApplicationController
  before_action :authenticate_user!,  except:[:show]
  before_action :access_check, only:[:edit, :update]

  def index
    redirect_to new_recipe_path
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:image, :cooking_name, :ingredient, :process, :genre_id, :cook_time_id, :side_dishes_id).merge(user_id: current_user.id )
  end

  def access_check
    author = Recipe.find(params[:id])
    if current_user.id != author.user_id
      redirect_to root_path
    end
  end

end
