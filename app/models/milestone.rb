class Milestone < ApplicationRecord
	belongs_to :project
	has_many :items
	belongs_to :team
	
end
