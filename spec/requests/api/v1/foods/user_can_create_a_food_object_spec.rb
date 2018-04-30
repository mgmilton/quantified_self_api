require 'rails_helper'

context 'post to api/v1/foods' do
  it "returns a newly created food object when attributes are valid" do
    payload_json = {
      food: {
        "name": "Bagels and Lox",
        "calories": 500
      }
    }

    post "/api/v1/foods", params: payload_json
    food = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_success
    expect(food[:name]).to eq("Bagels and Lox")
    expect(food[:calories]).to eq(500)
  end

  it "returns a 400 error if attributes are invalid" do
    post "/api/v1/foods", params: {food: {name: 'Empty Calories'}}

    res = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(res[:error]).to eq("missing required fields")
  end
end
