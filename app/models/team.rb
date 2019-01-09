class Team < ApplicationRecord
	     has_many :positions
         has_many :users, through: :positions
         has_many :member_employments
         has_many :employments, :as => :employable
         has_many :milestones
end
