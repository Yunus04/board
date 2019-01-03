class ProjectController < ApplicationController

 	def index
 		@project = Project.all
 	
 	end

 	def new
 		
 	end

end