# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'edit Synth' do 
  describe 'Edit Synth' do 
    
    it 'links to edit page from child show page' do 
      @company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      @synth = @company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/synths/#{@synth.id}"
      click_button "Edit Synth"

      expect(current_path).to eq("/synths/#{@synth.id}/edit")
    end

    it 'can edit the synth' do 
      @company = Company.create(name: 'Roland Cororation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
      @synth = @company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")

      visit "/synths/#{@synth.id}/edit"
      fill_in("Name", with: "Juno 60")

      click_button "Update Synth"
      

      expect(current_path).to eq("/synths/#{@synth.id}")
      expect(page).to have_content("Juno 60")
    end
  end 
end