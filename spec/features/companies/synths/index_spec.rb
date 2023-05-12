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
end