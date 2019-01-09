class Task < ApplicationRecord
	has_many :items
	has_many :item_notes, :as => :itemable
	has_many :comments, :as => :commentable
	has_and_belongs_to_many :documents
	belongs_to :project


	# def code(tas)
	# 	kode = tas.code.chars.last
	# 	kode = kode+1
	# 	self.code = kode

	# end

end
