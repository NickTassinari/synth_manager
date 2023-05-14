require 'rails_helper'

RSpec.describe 'Company Index Page' do 
#   User Story 1, Parent Index 

#   For each parent table
#   As a visitor
#   When I visit '/parents'
#   Then I see the name of each parent record in the system
  describe 'visit company index page' do 
    

    it 'can see the name of each company' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      company_2 = Company.create!(name: 'Moog', country_of_origin: "US", active: true, years_in_operation: 70)
      visit "/companies"

      expect(page).to have_content(company.name)
      expect(page).to have_content(company_2.name)
    end
  end

  # User Story 6, Parent Index sorted by Most Recently Created 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  describe 'can see companies organized by creation date' do 
    it 'shows when company was created, sorted by most recent creation date' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      company_2 = Company.create!(name: 'Moog', country_of_origin: "US", active: true, years_in_operation: 70)
      company_3 = Company.create!(name: 'Korg', country_of_origin: "Japan", active: true, years_in_operation: 61)
      visit "/companies"

      expect(company.name).to appear_before(company_3.name)
    end
  end

end