class Animal < ApplicationRecord
	has_many :coincidences
	belongs_to :animalcat 
	has_many :articles 
	has_many :tests
end
