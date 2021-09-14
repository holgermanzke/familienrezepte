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
      flash[:notice] = "Zutat erfolgreich angelegt"
      redirect_to ingredients_path
    else
      flash[:alert] = "Zutat konnte nicht angelegt werden"
      render "new"
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Zutat erfolgreich geändert"
      redirect_to ingredients_path
    else
      flash[:alert] = "Zutat konnte nocht geändert werden"
      render "edit"
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
