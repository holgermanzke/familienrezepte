class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredient_units = IngredientUnit.all
    @recipe.ingredients.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Rezept wurde erfolgreich angelegt"
      redirect_to recipes_path
    else
      flash[:error] = "Upps... das Rezept konnte nicht gespeichert werden."
      render "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, ingredients_attributes: [:id, :name, :value, :ingredient_unit_id, :_destroy])
  end

end
