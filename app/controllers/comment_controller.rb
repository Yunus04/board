class CommentController < ApplicationController

before_action :authenticate_user!, only: [:index]

	def create
		#debugger
		@project = Project.find(params[:project_id])
 		@comment = Comment.new(resource_params)

 			@objek = @comment.commentable
 		if @objek.class.name == 'Task'
			@link =  project_task_path(:id => @objek.id, :project_id => @project.id)
			@render = 'task/show'

 		elsif @objek.class.name == 'Issue'
 			@render = 'issue/show'

 			@link =  project_issue_path(:id => @objek.id, :project_id => @project.id)
 					
 		else
 			@link = root_path
 		end	
 			if @comment.save
				redirect_to @link	
 				

 			else
 				render @render 
 			end
 	end

 private

 	def resource_params
		params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
	end

end