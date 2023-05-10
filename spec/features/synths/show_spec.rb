require 'rails_helper'

RSpec.describe 'the synth show page' do 
  it 'displays synth name' do 
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    visit "/synths/#{synth.id}"
    
    expect(page).to have_content(synth.name)
    expect(page).to_not have_content(synth_2.name)
  end

  it 'displays the name of company of synth' do 
    company = Company.create!(name: 'Roland Corporation', country_of_origin: 'Japan', active: true, years_in_operation: 51)
    synth = company.synths.create!(name: 'Juno 106', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    synth_2 = company.synths.create!(name: 'Juno 60', polyphony: true, number_of_voices: 6, production_years: "1984-1988")
    visit "/synths/#{synth.id}"

    expect(page).to have_content(company.name)
  end
end