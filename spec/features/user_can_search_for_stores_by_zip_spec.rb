require 'rails_helper'

RSpec.feature "Search by Zip" do
  scenario "user can search by zip" do

    visit '/search?&zip=80202'

    expect(current_path).to eq("/search")

    expect(page).to have_content("17 results!")
    expect(page).to have_content("18.51")
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results

  end
end
