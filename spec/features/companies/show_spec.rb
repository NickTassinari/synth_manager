require 'rails_helper'

RSpec.describe '/company/:id page' do 

# User Story 2, Parent Show 

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  describe 'visit company/:id page' do 
    
    it 'can see the company and all its attributes' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      company_2 = Company.create!(name: 'Moog', country_of_origin: "US", active: true, years_in_operation: 70)
      visit "/companies/#{company.id}"

      expect(page).to have_content("#{company.name}")
      expect(page).to have_content("Country of Origin: #{company.country_of_origin}")
      expect(page).to have_content("Active?: #{company.active}")
      expect(page).to have_content("Years in Operation: #{company.years_in_operation}")
    end

  end

end 