class Task < ApplicationRecord
	has_many :items
	has_many :item_notes, :as => :itemable
	has_many :comments, :as => :commentable
	has_and_belongs_to_many :documents
	belongs_to :project



end
