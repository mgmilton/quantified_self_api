class Food < ApplicationRecord
  has_many :mealfoods, class_name: 'MealFood'
  has_many :meals, through: :mealfoods
  validates_presence_of :name, :calories
end
