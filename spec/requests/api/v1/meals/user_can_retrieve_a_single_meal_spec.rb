require "rails_helper"
context 'get to api/v1/foods/:meal_id/foods' do
  it "returns a matching meal object and all associated foods" do
    spanakopita = create(:food)
    meal_1 = create(:meal)
    mealfood = create(:meal_food, meal: meal_1, food: spanakopita )

    get "/api/v1/meals/#{meal_1.id}/foods"

    meal = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(meal[:name]).to eq("Dinner")
    expect(meal[:foods].first[:name]).to eq("Spanakopita")
  end

  it "returns a 404 if meal not found" do
    get '/api/v1/meals/303003/foods'

    error = JSON.parse(response.body)

    expect(response.status).to eq(404)
    expect(error).to eq({"error"=>"not-found"})
  end
end
