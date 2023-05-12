require 'rails_helper'

RSpec.describe Company do 
  describe "relationships" do 
    it { should have_many :synths }
  end
end