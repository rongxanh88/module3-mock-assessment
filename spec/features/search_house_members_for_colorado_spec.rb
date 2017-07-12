require "rails_helper"

RSpec.feature "Search House Members", :type => :feature do
  scenario "User searches for house members from Colorado" do
    visit root_path

    select "Colorado", :from => "state"
    click_on "Locate Members of the House"
    representatives = Representative.where(state: "CO").order("seniority DESC")

    expect(page).to have_content("7 Results")
    7.times do |n|
      expect(page).to have_content(representatives[n-1].name)
      expect(page).to have_content(representatives[n-1].role)
      expect(page).to have_content(representatives[n-1].party)
      expect(page).to have_content(representatives[n-1].seniority)
      expect(page).to have_content(representatives[n-1].district)
    end
  end
end