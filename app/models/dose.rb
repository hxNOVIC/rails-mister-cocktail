class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :ingredient_id, :uniqueness => { :scope => :cocktail_id }
end
