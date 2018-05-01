require "rails_helper"

context 'delete to api/v1/meals/:meal_id/foods/:id' do
  it "removes the food from the meal" do
    spanakopita = create(:food)
    meal_1 = create(:meal)
    mealfood = create(:meal_food, meal: meal_1, food: spanakopita )

    delete "/api/v1/meals/#{meal_1.id}/foods/#{spanakopita.id}"

    delete_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(delete_response[:message]).to eq("Successfully removed Spanakopita from Dinner")
    expect(meal_1.foods).to be_empty
  end

  it "returns a 404 error if the food object cannot be found" do
    dinner = create(:meal)

    delete "/api/v1/meals/#{dinner.id}/foods/330303"

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(error[:error]).to eq("not-found")
  end

  it "returns a 404 error if the meal object cannot be found" do
    spanakopita = create(:food)
    delete "/api/v1/meals/303003/foods/#{spanakopita.id}"

    error = JSON.parse(response.body)

    expect(response.status).to eq(404)
    expect(error).to eq({"error"=>"not-found"})
  end
end
