class Company < ApplicationRecord 
  has_many :synths, dependent: :destroy 
end 