class MilestoneController < ApplicationController

	def index
		@project = Project.find(params[:project_id])
 		@milestones = @project.milestones
 	end

 	def show
 		@project = Project.find(params[:project_id])
 		@milestones = Milestone.find(params[:id])
 	end

 	def new
 		@project = Project.find(params[:project_id])
 		@milestones = Milestone.new

 	end

 	def create
 		@milestones = Milestone.new(resources_params)
 		if @milestones.save
 			puts 'Milestone was successfuly created'
 			redirect_to project_milestone_index_path
		else
			render 'new'
		end	
 	end

 	def edit
 		@project = Project.find(params[:project_id])
 		@milestones  = Milestone.find(params[:id])
 	end

 	def update
		@project = Project.find(params[:project_id])

		@milestones = Milestone.find(params[:id])

		if @milestones.update(resources_params)
			redirect_to project_milestone_path(@project)
		else
			render 'edit'
		end
 	end

 	def destroy
 		@milestones = Milestone.find(params[:id])
		@milestones.destroy
		redirect_to project_milestone_index_path, notice: 'Milestone berhasil di hapus' 	 			
		
 	end

	private

	def resources_params
		params.require(:milestone).permit(:name, :description, :project_id, :team_id, :start_date, :end_date)
	end	

end