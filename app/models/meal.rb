class Meal < ApplicationRecord
  has_many :foods
  validates_presence_of :name
end
