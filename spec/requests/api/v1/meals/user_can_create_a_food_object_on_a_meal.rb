require "rails_helper"

context "post to api/v1/meals/:meal_id/foods/:id" do
  it "returns a success message after creating associated food" do
    spanakopita = create(:food)
    dinner = create(:meal)

    post "/api/v1/meals/#{dinner.id}/foods/#{spanakopita.id}"

    meal = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(meal[:message]).to eq("Successfully added Spanakopita to Dinner")
  end

  it "returns a 404 error if food does not exist" do
    dinner = create(:meal)

    post "/api/v1/meals/#{dinner.id}/foods/330303"

    error = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(404)
    expect(error[:error]).to eq("not-found")
  end

  it "returns a 404 error if meal does not exist" do

  end
end
