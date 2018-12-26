class MemberEmployment < ApplicationRecord
	belongs_to :employment
	belongs_to :user
	belongs_to :team
end
