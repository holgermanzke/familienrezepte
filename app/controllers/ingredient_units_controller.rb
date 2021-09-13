class IngredientUnitsController < ApplicationController
  def index
    @ingredient_units = IngredientUnit.all
  end

  def new
    @ingredient_unit = IngredientUnit.new
  end

  def create
    @ingredient_unit = IngredientUnit.new(ingredient_unit_params)
    if @ingredient_unit.save
      flash[:notice] = "Einheit erfolgreich erstellt"
      redirect_to ingredient_units_path
    else
      flash[:alert] = "Einheit konnte nicht erstellt werden!"
      render "new"
    end
  end

  private
  def ingredient_unit_params
    params.require(:ingredient_unit).permit(:name, :shortcut)
  end

end
