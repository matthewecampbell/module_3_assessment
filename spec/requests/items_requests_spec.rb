require 'rails_helper'

RSpec.describe "Items Get Requests", type: :request do
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

RSpec.describe "Items Delete Requests", type: :request do
  scenario "it can delete an item" do
    item_one, item_two = create_list(:item, 2)

    get '/api/v1/items/1'

    expect(json.count).to eq(4)
    expect(json["id"]).to eq(1)
    expect(json["description"]).to eq("description for item")
    expect(json["image_url"]).to eq("www.example.com")
    expect(json["created_at"]).to eq(nil)
    expect(json["updated_at"]).to eq(nil)

    delete '/api/v1/items/1'

    expect(response.status).to eq(204)
  end
end

RSpec.describe "Items Create Requests", type: :request do
  scenario "request can create an item" do
    item_one, item_two = create_list(:item, 2)

    get '/api/v1/items'

    expect(json.count).to eq(2)
    expect(json.first["id"]).to eq(1)
    expect(json.first["description"]).to eq("description for item")
    expect(json.first["image_url"]).to eq("www.example.com")
    expect(json.first["created_at"]).to eq(nil)
    expect(json.first["updated_at"]).to eq(nil)

    post '/api/v1/items?name=matt&description=hi&image_url=www.turing.com'

    expect(json.count).to eq(4)
    expect(json["id"]).to eq(3)
    expect(json["description"]).to eq("hi")
    expect(json["image_url"]).to eq("www.turing.com")
    expect(json["created_at"]).to eq(nil)
    expect(json["updated_at"]).to eq(nil)
    expect(response.status).to eq(201)
  end
end
