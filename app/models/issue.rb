class Issue < ApplicationRecord
	has_many :item_notes, :as => :itemable
	has_and_belongs_to_many :documents
	has_many :comments, :as => :commentable
	belongs_to :project

	enum status: { open:0, in_progres:1, to_be_tested:2, closed:3 }
end
