require 'rails_helper'

RSpec.describe 'Synth Creation' do 
  # User Story 13, Parent Child Creation 

  # As a visitor
  # When I visit a Parent Children Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed

  it 'links to new page from company show page' do 
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)

    visit "/companies/#{company.id}/synths"

    click_link("Add Synth")
    expect(current_path).to eq("/companies/#{company.id}/synths/new")
  end

  it 'can create new synth' do 
    @company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)

    visit "/companies/#{@company.id}/synths/new"

    fill_in("Name", with: 'D50')
    fill_in("Polyphony", with: 'true')
    fill_in("Number of voices", with: '32')
    fill_in("Production years", with: '1987')

    click_button("Add Synth")

    expect(current_path).to eq("/companies/#{@company.id}/synths")
    expect(page).to have_content("D50")
  end
end