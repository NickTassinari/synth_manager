require 'rails_helper'

RSpec.describe 'edit company' do 
  describe 'Edit Company' do 
    # User Story 12, Parent Update 

    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
    it 'links to edit page from parent show page' do 
      company = Company.create!(name: 'Korg', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      
      visit '/companies'
      click_button "Edit #{company.name}"

      expect(current_path).to eq("/companies/#{company.id}/edit")
    end

    it 'can edit the company' do 
      company = Company.create(name: 'Roland Cororation', country_of_origin: 'Japan', active: true, years_in_operation: 51)

      visit "/companies"

      expect(page).to have_content("Roland Cororation")
      
      click_button 'Edit Roland Cororation'
      fill_in "Name", with: "Roland Corporation"
      click_button "Update Company"

      expect(current_path).to eq('/companies')
      expect(page).to have_content("Roland Corporation")
    end 
  end
end