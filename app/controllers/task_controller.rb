class TaskController < ApplicationController

 	def index
 		@project = Project.find(params[:project_id])
 		@task = @project.tasks
	 end

	def show
		@project = Project.find(params[:project_id])
		@task = Task.find(params[:id])
		@comments = @task.comments.where(commentable_type: 'Task')
		@comment = Comment.new 
	end

	def new
		@project = Project.find(params[:project_id])
		@task = Task.new
		@last = Task.where(project_id: @project.id)
		@t = @last.last
		@code = @task.sandi(@t)

	end

	def create
		@task = Task.new(resource_params)
		if @task.save
			redirect_to project_task_index_path
		else
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:project_id])
		@task = Task.find(params[:id])
	end

	def update
		@project = Project.find(params[:project_id])

		@task = Task.find(params[:id])

		if @task.update(resource_params)
			redirect_to project_task_path(@project)
		else
			render 'edit'
		end		
		
	end

	def destroy
 		@task = Task.find(params[:id])
		@task.destroy
		redirect_to project_task_index_path, notice: 'Task berhasil di hapus' 	 	

	end
		
	private

	def resource_params
		params.require(:task).permit(:code, :name, :start_date, :end_date, :project_id)		
	end	

end