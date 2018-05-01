class Meal < ApplicationRecord
  has_many :mealfoods, class_name: 'MealFood'
  has_many :foods, through: :mealfoods
  validates_presence_of :name
end
