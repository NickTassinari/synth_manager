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
    # User Story 7, Parent Child Count
  
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent

    it 'can see company with number of associated synths' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      company_2 = Company.create!(name: 'Moog', country_of_origin: "US", active: true, years_in_operation: 70)
      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/companies/#{company.id}"
      expect(page).to have_content("Number of Synths: #{company.synths.count}")
    end
    
    # User Story 10, Parent Child Index Link

    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

    it 'can link to child table index of company' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      company_2 = Company.create!(name: 'Moog', country_of_origin: "US", active: true, years_in_operation: 70)
      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/companies/#{company.id}"
      expect(page).to have_link("#{company.name} Synthesizers")

      click_link("#{company.name} Synthesizers")
      expect(current_path).to eq("/companies/#{company.id}/synths")
    end
  
    # User Story 19, Parent Delete 

    # As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent

    it 'can has a delete link for each company' do 
      company = Company.create!(name: 'Solina', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/companies/#{company.id}"
      click_link "Delete #{company.name}"

      expect(current_path).to eq("/companies")
      expect(page).to_not have_content("#{company.name}")
    end
  end






end 