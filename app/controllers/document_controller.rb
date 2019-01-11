class DocumentController < ApplicationController


	def create
		@project = Project.find(params[:project_id])
		@document = Document.new(resources_params)

		if @document.save
			@project = Project.find(params[:project_id])
			redirect_to project_task_path(project_id: @project.id)
		else
			render 'project/show'
		end
	end

 private

 	def resources_params
 		params.require(:document).permit(:document, :project_id)
 	end

end