class Task < ApplicationRecord
	has_many :items
	has_many :item_notes, :as => :itemable
	has_many :comments, :as => :commentable
	has_and_belongs_to_many :documents
	belongs_to :project




	 def sandi(last)
	 	if last.nil?
	 		self.code = "T-1"
	 	else
		 		kode = last.code[2..3]
		 		kode = kode.to_i + 1
		 		self.code = "T-" + kode.to_s
	 	end
	 end

end
