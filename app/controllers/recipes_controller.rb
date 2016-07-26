class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
     @recipe.make_new_ingredients(params)
      redirect_to recipes_url
    else
      redirect_to recipes_new_url
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
       @recipe.make_new_ingredients(params)
      redirect_to recipe_url(@recipe)
    else
      redirect_to recipes_edit_url
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :description, :made_it_yet, :ingredient_ids => [])
  end
end
