class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :positions
         has_many :projects
         has_many :teams, through: :positions
         has_many :member_employments
         has_many :employments, :as => :employable

 
after_create :sample_data
	private 
	def sample_data

		@project = Project.create(name: "For example the first project", created: Time.now ,  description: "
this is an example of the first project created by the application, please see the flow of the example of this project so that you understand how to use our application", user_id: self.id )
		@task = Task.create(code: 'T-1', name: 'For example teh first your task', start_date: Time.now, project_id: @project.id )
		@milestone = Milestone.create(name: 'For example the first milestones', description: 'This is an exmaple of the first milestones on your project', start_date: Time.now , project_id: @project.id )
		#debugger
		@Item = Item.create(milestone_id: @milestone.id, task_id: @task.id )
		@issue = Issue.create(code: 'I-1', title: 'Issue for the project ' , description: 'This is example issue for the project',created: Time.now, project_id: @project.id )

		
	end

end




