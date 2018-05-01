require "rails_helper"

context 'patch to api/v1/foods/:id' do
  it "returns a newly updated food object when attributes are valid" do
    spinach_pie = create(:food)

    payload_json = {
      food: {
        "name": "Carrots",
        "calories": 300
      }
    }

    patch "/api/v1/foods/#{spinach_pie.id}", params: payload_json
  end

  it "returns a 400 error if attributes are invalid" do
    spinach_pie = create(:food)
    patch "/api/v1/foods/#{spinach_pie.id}", params: {food: {name: 'Empty Calories'}}

    res = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(res[:error]).to eq("missing required fields")
  end
end
