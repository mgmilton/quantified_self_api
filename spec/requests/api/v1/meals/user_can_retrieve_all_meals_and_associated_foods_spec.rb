require 'rails_helper'

context 'get to api/v1/meals' do
  it "returns all meals and associated fodos" do
    spanakopita = create(:food)
    meal_1 = create(:meal)
    mealfood = create(:meal_food, meal: meal_1, food: spanakopita )

    get "/api/v1/meals"

    meal_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(meal_response.first[:foods].first[:name]).to eq("Spanakopita")
    expect(meal_response.first[:name]).to eq("Dinner")
  end
end
