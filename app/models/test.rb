class Test < ApplicationRecord
	belongs_to :animal
	belongs_to :user
	has_many :results
	has_many :answers, through: :results
end
