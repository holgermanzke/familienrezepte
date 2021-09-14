class Ingredient < ApplicationRecord
  has_many :ingredient_units
  belongs_to :recipe
  validates :name, :value, :ingredient_unit_id, presence: true
end
