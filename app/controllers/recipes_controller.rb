class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(:cooking_name, :ingredient, :process, :genre_id, :cook_time_id, :side_dishes_id).merge(user_id: current_user.id )
  end

end
