class Food < ApplicationRecord
  belongs_to :meal

  validates_presence_of :name, :calories
end
