# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'yunus@gmail.com', name: 'Mohamad Yunus', password: 'yunus123')
User.create(email: 'anugrah@gmail.com', name: 'Anugrah Wardhani', password: 'anugrah123')
User.create(email: 'alan@gmail.com', name: 'Muhamad Alan', password: 'alan123')
User.create(email: 'iman@gmail.com', name: 'Iman Ismayana', password: 'iman123')
User.create(email: 'heru@gmail.com', name: 'Heru Julyanto', password: 'iman123')

Project.create(name: 'For example the first project', created: Time.now ,  description: '
this is an example of the first project created by the application, please see the flow of the example of this project so that you understand how to use our application', user_id: 1 )

@team = Team.create(name: 'nineod', created: Time.now )

Position.create(user_id: 1, team_id: 1, position: 3)
Position.create(user_id: 2, team_id: 1, position: 0)
Position.create(user_id: 3, team_id: 1, position: 0)
Position.create(user_id: 4, team_id: 1, position: 1)
Position.create(user_id: 5, team_id: 1, position: 2)

@employment = Employment.create(project_id: 1, employable_type: @team.class.name, employable_id: @team.id, status: 1)

MemberEmployment.create(employment_id: @employment.id, user_id: 1, team_id: @team.id)

Milestone.create(name: 'For example the first milestones', description: 'This is an exmaple of the first milestones on your project', start_date: Time.now , project_id: 1, team_id: 1)

@task = Task.create(code: 'T-1', name: 'For example teh first your task', start_date: Time.now, project_id: 1 )

Item.create(milestone_id: 1, task_id: @task.id )

Issue.create(code: 'I-1', title: 'Issue for the project ' , description: 'This is example issue for the project',created: Time.now, project_id: 1 )

Comment.create(comment: 'Example The Comment', commentable_type: @task.class.name, commentable_id: @task.id )

