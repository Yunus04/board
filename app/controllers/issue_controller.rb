class IssueController < ApplicationController

	 def index
	 	@project = Project.find(params[:project_id])
	 	@issue = @project.issues
	 end

	 def show
	 	@project = Project.find(params[:project_id])
	 	@issue = Issue.find(params[:id])
	 	@comments = @issue.comments.where(commentable_type: 'Issue')
		@comment = Comment.new 
	 end

	 def new
	 	@project = Project.find(params[:project_id])
	 	@issue = Issue.new
		@last = Issue.where(project_id: @project.id)
		@t = @last.last
		@code = @issue.sandi(@t)
	 end

	 def create
	 	@issue = Issue.new(resource_params)
	 	if @issue.save
	 		redirect_to project_issue_index_path
	 	else
	 		render 'new'
	 	end
	 end

	 def edit
	 	@project = Project.find(params[:project_id])
	 	@issue = Issue.find(params[:id])
	 end

	 def update
	 	@project = Project.find(params[:project_id])
	 	@issue = Issue.find(params[:id])

	 	if @issue.update(resource_params)
	 		redirect_to project_issue_index_path
	 	else
	 		render 'edit'
	 	end
	 end

	 def destroy
	 	@issue = Issue.find(params[:id])
		@issue.destroy
		redirect_to project_issue_index_path, notice: 'Issue berhasil di hapus' 	 
	 end

	 private

	 def resource_params
	 	params.require(:issue).permit(:code, :title, :description, :created, :status, :project_id)
	 end

end