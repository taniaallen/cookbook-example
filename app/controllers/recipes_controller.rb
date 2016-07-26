class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @new_ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe.add_ingredients_from_hash(params)
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
      @recipe.add_ingredients_from_hash(params)
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
    ## Using .collection_check_boxes
    params.require(:recipe).permit(:title, :description, :made_it_yet, ingredient_ids: [])
    ## Using .fields_for
    # params.require(:recipe).permit(:title, :description, :made_it_yet, ingredients_attributes: [:id, :name, :_destroy])
  end
end
