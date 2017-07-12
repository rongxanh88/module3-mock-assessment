require "rails_helper"

RSpec.feature "Search House Members", :type => :feature do
  scenario "User searches for house members from Colorado" do
    skip
    visit root_path

    select "Colorado", :from => "state"
    click_on "Locate Members of the House"

    expect(page).to have_current_path(search_path)
    expect(page).to have_content("7 Results")
  end
end

# Then my path should be "/search" with "state=CO" in the parameters
# And I should see a message "7 Results"
# And I should see a list of 7 the members of the house for Colorado
# And they should be ordered by seniority from most to least
# And I should see a name, role, party, and district for each member