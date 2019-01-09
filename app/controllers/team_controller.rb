class TeamController < ApplicationController

 def index
 	@team = Team.all
 end

end