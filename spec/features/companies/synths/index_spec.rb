require 'rails_helper'

RSpec.describe '/companies/:company_id/synths' do 
  # User Story 5, Parent Children Index 

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)
  describe 'visit companies index page' do 
    it 'can see each synth related to company and all synth attributes' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      company_2 = Company.create!(name: 'Moog', country_of_origin: "US", active: true, years_in_operation: 70)

      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_3 = company_2.synths.create!(name: 'Moog Rogue', polyphony: false, number_of_voices: 1, production_years: 1981)

      visit "/companies/#{company.id}/synths"

      expect(page).to have_content(company.name)
      expect(page).to have_content("#{synth.name}")
      expect(page).to have_content("Polyphony: #{synth.polyphony}")
      expect(page).to have_content("Number of Voices: #{synth.number_of_voices}")
      expect(page).to have_content("Production Years: #{synth.production_years}")
      expect(page).to have_content("Synth ID: #{synth.id}")
      expect(page).to have_content("Company ID: #{synth.company_id}")
    
      
      expect(page).to have_content("#{synth_2.name}")
      expect(page).to have_content("Polyphony: #{synth_2.polyphony}")
      expect(page).to have_content("Number of Voices: #{synth_2.number_of_voices}")
      expect(page).to have_content("Production Years: #{synth_2.production_years}")
      expect(page).to have_content("Synth ID: #{synth_2.id}")
      expect(page).to have_content("Company ID: #{synth_2.company_id}")
    
      


    end
  end

  # User Story 16, Sort Parent's Children in Alphabetical Order by name 

  # As a visitor
  # When I visit the Parent's children Index Page
  # Then I see a link to sort children in alphabetical order
  # When I click on the link
  # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  describe 'parents children in alphabetical order' do 
    xit 'can sort synths in alphabetical order' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_3 = company.synths.create!(name: 'D 50', polyphony: true, number_of_voices: 32, production_years: "1987")
    
      expect(synth.name).to appear_before(synth_3.name)

      visit "/companies/#{company.id}/synths"

      expect(synth_3.name).to appear_before(synth.name)
    end
  end

  # User Story 21, Display Records Over a Given Threshold 

  # As a visitor
  # When I visit the Parent's children Index Page
  # I see a form that allows me to input a number value
  # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
  # Then I am brought back to the current index page with only the records that meet that threshold shown.

  xit 'has a form to input a value to return a certain number of records' do 
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_3 = company.synths.create!(name: 'D 50', polyphony: true, number_of_voices: 32, production_years: "1987")
    
    visit "/companies/#{company.id}/synths"

    fill_in(:number_of_voices, with: 30)
    click_button "Return Synths with voice count more than this"

    expect(current_path).to eq("/companies/#{company.id}/synths")
    expect(page).to have_content(synth_3.name)
    expect(page).to_not have_content(synth.name)
    expect(page).to_not have_content(synth_2.name)
  end
  
end