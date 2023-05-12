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
  
end