class Project < ApplicationRecord
	has_many :issues
	has_many :tasks
	has_many :milestones
	has_many :release_notes
	has_many :employments
	has_one :documents
end
