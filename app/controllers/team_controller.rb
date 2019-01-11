class TeamController < ApplicationController

	def index
		@position = Position.where(user_id: current_user.id)
 	end

 	def show
 		@team = Team.find(params[:id])
 		@position = Position.where(team_id: @team.id)
 	end

 	def new
 		@team = Team.new
 		@team.positions.build
 	end

 	def create
		@team = Team.new(resorce_params)
		if @team.save
		redirect_to team_index_path
		else
		render 'new'
		end	
 	end

 	def edit
 		@team = Team.find(params[:id])
 	end

 	def update
 		@team = Team.find(params[:id])
 		if @team.update(resorce_params)
 			redirect_to team_path(@team)
 		else
 			render 'edit'
 		end
 	end

 	def delete
 		
 	end

 private
 
 	def resorce_params
 		params.require(:team).permit(:name, :created, positions_attributes: [:user_id, :level])	
 	end	

end