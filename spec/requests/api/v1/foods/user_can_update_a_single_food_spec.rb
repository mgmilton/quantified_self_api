require "rails_helper"

context 'patch to api/v1/foods/:id' do
  it "returns a newly updated food object when attributes are valid" do
    spinach_pie = create(:food)

    payload_json = {
      food: {
        "name": "Carrots",
        "calories": 30
      }
    }

    patch "/api/v1/foods/#{spinach_pie.id}", params: payload_json

    res = JSON.parse(response.body, symbolize_names: true)
    expect(res[:name]).to eq("Carrots")
    expect(res[:calories]).to eq(30)
  end

  it "returns a 400 error if attributes are invalid" do
    spinach_pie = create(:food)
    patch "/api/v1/foods/#{spinach_pie.id}", params: {food: {name: 'Empty Calories'}}

    res = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(res[:error]).to eq("missing required fields")
  end
end
