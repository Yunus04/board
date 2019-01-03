class MilestoneController < ApplicationController

 def index
 	@milestones = Milestone.all
 end

end