require 'rails_helper'

RSpec.describe 'application layout view' do 
  # User Story 8, Child Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index

  describe 'link to synth index' do 
    it 'can visit any page on the site and see synth index at the top' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/companies"
      expect(page).to have_link("All Synths")

      click_link("All Synths")
      expect(current_path).to eq("/synths")

      visit "/companies/#{company.id}"
      expect(page).to have_content("All Synths")

      click_link("All Synths")
      expect(current_path).to eq("/synths")
    end
  end 

end