require 'rails_helper'

context 'get to api/v1/foods' do
  it "returns all food objects" do
    spanakopita = create(:food)
    pie = create(:food, name: 'pie')

    get "/api/v1/foods"

    foods = JSON.parse(response.body)
    expect(response).to be_success
    expect(foods.count).to eq(2)
    expect(foods[1]["name"]).to eq("pie")
  end
end
