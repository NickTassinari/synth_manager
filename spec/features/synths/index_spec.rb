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

  describe 'child index shows true records only' do 
    it 'can only see polyphonic synths on the child index' do 
      company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
      synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/synths"

      expect(page).to have_content(synth.name)
      expect(page).to have_content(synth_2.name)
    end
  end
  # User Story 18, Child Update From Childs Index Page 

  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
  describe 'edit synth' do 
    xit 'links to edit synth page' do 
      @company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      @synth = @company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/synths"
      click_button "Edit #{@synth.name}"
      expect(current_path).to eq("/synths/#{@synth.id}/edit")
    end

    it 'can edit the synth' do 
      @company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      @synth = @company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/synths/#{@synth.id}/edit"
      fill_in("Name", with: "Juno 60")

      click_button "Update Synth"

      expect(current_path).to eq("/synths/#{@synth.id}")
      expect(page).to have_content("Juno 60")
    end
  end
end