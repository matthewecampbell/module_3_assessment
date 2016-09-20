require 'rails_helper'

RSpec.describe "Root Path", type: :request do
  scenario "visitor can visit root path and see items" do
    Capybara.app = Storedom::Application

    get '/'
    expect(response.status).to eq(200)
    within('h1') do
      expect(page).to have_content("Items")
    end
  end
end
