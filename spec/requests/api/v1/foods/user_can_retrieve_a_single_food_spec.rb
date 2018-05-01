require 'rails_helper'
context 'get to api/v1/foods/:id' do
  it "returns a matching food object" do
    blood_sausage = create(:food, name: 'morcilla')

    get "/api/v1/foods/#{blood_sausage.id}"

    food = JSON.parse(response.body)
    expect(response).to be_success
    expect(food["name"]).to eq("morcilla")
    expect(food["calories"]).to eq(400)
  end

  it "returns a 404 if food not found" do
    get '/api/v1/foods/303003'

    error = JSON.parse(response.body)

    expect(response.status).to eq(404)
    expect(error).to eq({"error"=>"not-found"})
  end
end
