class Team < ApplicationRecord
	     has_many :positions
         has_many :users, through: :positions
         has_many :member_employments
         has_many :employments, :as => :employable
         has_many :milestones

# after_create :sample_data
# 	private 

# 	def sample_data
# 		@position = Position.create(user_id: team.user, team_id: self.id, position: 3 )
		
# 	end

	accepts_nested_attributes_for :positions

end
