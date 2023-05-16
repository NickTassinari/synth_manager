require 'rails_helper'

RSpec.describe 'the synth show page' do 

  #user story 4
  it 'displays synth name' do 
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    visit "/synths/#{synth.id}"
    
    expect(page).to have_content(synth.name)
    expect(page).to_not have_content(synth_2.name)
    expect(page).to have_content(synth.polyphony)
    expect(page).to have_content(synth.number_of_voices)
    expect(page).to have_content(synth.production_years)
  end

  it 'displays the name of company of synth' do 
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    visit "/synths/#{synth.id}"

    expect(page).to have_content(company.name)
  end

  # User Story 20, Child Delete 

  # As a visitor
  # When I visit a child show page
  # Then I see a link to delete the child "Delete Child"
  # When I click the link
  # Then a 'DELETE' request is sent to '/child_table_name/:id',
  # the child is deleted,
  # and I am redirected to the child index page where I no longer see this child

  it 'can delete synth' do 
    company = Company.create!(name: 'Chibson', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Chuno', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'another synth', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

    visit "/synths/#{synth.id}"
    click_link "Delete #{synth.name}"

    expect(current_path).to eq('/synths')
    expect(page).to_not have_content("#{synth.name}")
  end
end