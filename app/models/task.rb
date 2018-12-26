class Task < ApplicationRecord
	has_many :items
	has_many :item_notes, :as => :itemable
	has_many :comments, :as => :commentable
	has_and_belongs_to_many :documents
	belongs_to :project


	enum priority: { none:0, low:1, medium:2, high:3}
end
