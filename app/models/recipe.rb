class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :title, :description, presence: true

  accepts_nested_attributes_for :ingredients
end
