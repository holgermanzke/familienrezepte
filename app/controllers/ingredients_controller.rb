class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "Zutat wurde angelegt"
      redirect_to ingredients_path
    else
      flash[:alert] = "Zutat konnte nicht gespeichert werden"
      render "new"
    end
  end

  private
  def ingredient_params
    params.require(:ingredients).permit(:name, :value)
  end

end
