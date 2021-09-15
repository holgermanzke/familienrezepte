class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy, inverse_of: :recipe
  validates :title, :description, presence: true

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
end
