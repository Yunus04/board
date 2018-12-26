class Document < ApplicationRecord
	belongs_to :project
	has_and_belongs_to_many :issues
	has_and_belongs_to_many :tasks
end
