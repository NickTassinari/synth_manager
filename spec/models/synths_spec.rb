require 'rails_helper'

RSpec.describe Synth do 
  describe 'relationships' do
    it { should belong_to :company}
  end 
end