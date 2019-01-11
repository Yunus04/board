class Issue < ApplicationRecord
	has_many :item_notes, :as => :itemable
	has_and_belongs_to_many :documents
	has_many :comments, :as => :commentable
	belongs_to :project

	enum status: { open:0, in_progres:1, to_be_tested:2, closed:3 }

	def sandi(last)
		 	if last.nil?
	 		self.code = "I-1"
	 	else
		 		kode = last.code[2..3]
		 		kode = kode.to_i + 1
		 		self.code = "I-" + kode.to_s
	 	end
	 end

end
