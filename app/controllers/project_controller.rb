class ProjectController < ApplicationController

	before_action :authenticate_user!, only: [:index]
	
 	def index
 		@project = Project.all
 	
 	end

 	def show
 		@project = Project.find(params[:id])
 		@milestones = Milestone.find(params[:id])
 				
 	end

 	def new
 		@project = Project.new

 	end

 	def create
 		@project = Project.new(resource_params)
 		@project.user = current_user
 		if @project.save
 			puts 'Project was successfully created'
 			redirect_to project_index_path

 		else
 			render 'new'
 			
 		end
 	end
 	
 	def edit
 		@milestones = Milestone.find(params[:id])
 		@project = Project.find(params[:id])
 	end

 	def update
 		@milestones = Milestone.find(params[:id])
		@project = Project.find(params[:id])
		
		if @project.update(resource_params)
			
			redirect_to project_path(@project)
		else
			render 'edit'
		end	 		
 	end

 	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to root_path, notice: 'Project berhasil di hapus' 		
 	end

 	private

 	def resource_params
 		params.require(:project).permit(:name, :description, :created, :status)
 	end

end