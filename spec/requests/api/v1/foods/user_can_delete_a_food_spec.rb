require "rails_helper"

context 'delete to api/v1/foods/:id' do
  it "returns a 204 if food is destroyed" do
    milkbone = create(:food, name: "dog treat")

    delete "/api/v1/foods/#{milkbone.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(Food.find_by(name: "dog treat")).to be_nil
  end

  it "returns a 404 error if the food object cannot be found" do
    delete "/api/v1/foods/202020"

    error = JSON.parse(response.body)

    expect(response.status).to eq(404)
    expect(error).to eq({"error"=>"not-found"})
  end
end
