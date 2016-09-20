require 'rails_helper'

RSpec.describe "Items Requests", type: :request do
    after(:each) do
      expect(response).to be_success
    end

  scenario "visitor can items path and see items" do
    item_one, item_two = create_list(:item, 2)

    get '/api/v1/items'

    expect(json.count).to eq(2)
    expect(json.first["id"]).to eq(1)
    expect(json.first["description"]).to eq("description for item")
    expect(json.first["image_url"]).to eq("www.example.com")
    expect(json.first["created_at"]).to eq(nil)
    expect(json.first["updated_at"]).to eq(nil)
  end

  scenario "visitor can an individual items path and see item" do
    item_one, item_two = create_list(:item, 2)

    get '/api/v1/items/1'

    expect(json.count).to eq(4)
    expect(json["id"]).to eq(1)
    expect(json["description"]).to eq("description for item")
    expect(json["image_url"]).to eq("www.example.com")
    expect(json["created_at"]).to eq(nil)
    expect(json["updated_at"]).to eq(nil)
  end
end
