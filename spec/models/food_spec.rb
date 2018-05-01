require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:calories)}
  end

  describe "relationships" do
    it {should have_many(:mealfoods)}
    it {should have_many(:meals).through(:mealfoods)}
  end
end
