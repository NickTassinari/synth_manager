require "rails_helper"

RSpec.describe "synths index page" do 
  
  # User Story 3, Child Index 

  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe 'visit /synths' do 
    
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

    it 'can see all synths and attributes' do 
      visit "/synths"

      expect(page).to have_content(synth.name)
      expect(page).to have_content("Polyphony?: #{synth.polyphony}")
      expect(page).to have_content("Number of Voices: #{synth.number_of_voices}")
      expect(page).to have_content("Production Years: #{synth.production_years}")
      
      expect(page).to have_content(synth_2.name)
      expect(page).to have_content("Polyphony?: #{synth_2.polyphony}")
      expect(page).to have_content("Number of Voices: #{synth_2.number_of_voices}")
      expect(page).to have_content("Production Years: #{synth_2.production_years}")
    end
  end
end