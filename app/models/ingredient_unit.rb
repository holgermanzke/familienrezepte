class IngredientUnit < ApplicationRecord
  belongs_to :ingredient
  validates :name, presence: true
end
