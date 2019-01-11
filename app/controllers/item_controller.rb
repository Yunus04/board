class ItemController < ApplicationController

	before_action :get_item_data, only: [:analis_move, :back_requirement, :worked_move, :back_analysis, :inp_move, :worked_back, :deploy_move, :inp_back, :completed_move, :destroy]

	def index
		@project = Project.find(params[:project_id])
		@milestones = @project.milestones

 	end

 	def show
 		@project = Project.find(params[:project_id])
 		@milestones = Milestone.find(params[:id])

 		@requirement = Item.where(milestone_id: @milestones ).where(list: 'requirement')
 		@analysis = Item.where(milestone_id: @milestones ).where(list: 'analysis_or_design')
 		@worked = Item.where(milestone_id: @milestones ).where(list: 'requirement_or_worked')
 		@inp = Item.where(milestone_id: @milestones ).where(list: 'inp')
 		@testing = Item.where(milestone_id: @milestones ).where(list: 'testing_or_deploy')
 		@completed = Item.where(milestone_id: @milestones ).where(list: 'completed')
 	end

 	def new
 		@project = Project.find(params[:project_id])
 		@milestones = Milestone.where(project_id: @project.id)
 		@task = Task.where(project_id: @project.id)
 		@item = Item.new
 	end

 	def create
 		@project = Project.find(params[:project_id])
 		@item = Item.new(resources_params)
 		if @item.save
 			redirect_to project_item_index_path
 		else
 			render 'new'
 		end	
 	end

 	def edit
 		@project = Project.find(params[:id])
 		@item = Item.find(params[:id])
 	end

 	def update
 		@project = Project.find(params[:id])
 		@item = Item.find(params[:id])
 		if @item.update(resources_params)
 			redirect_to project_item_index_path
 		else
 			render 'edit'
 		end
 	end

 	def destroy
 		
 	end

 	def analis_move

 		@item.move_to_analysis_or_design

 			if @item.save
 				redirect_to project_item_path(@project, @milestone)
 			else
 					
 				redirect_to project_item_path(@project, @milestone) 

 		end
 	end

 	def back_requirement
 		#debugger
 		@project = Project.find(params[:project_id])
 		
 		@item = Item.find(params[:id])
 		@item.back_to_requirement
 		@milestone = @item.milestone
 			if @item.save
 				redirect_to project_item_path(@project, @milestone)
 			else
 					
 				redirect_to project_item_path(@project, @milestone) 

 		end
 	end

 	def worked_move
 		

 		@item.move_to_requirement_or_worked
 		
 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end	
 	end

 	def back_analysis
 		
 		@item.back_to_analysis_or_design
 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end	
 	end 

 	def inp_move

 		@item.move_to_inp

 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end	
 	end 

 	def worked_back

 		@item.back_to_requirement_or_worked

 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end	
 	end 

 	def deploy_move

 		@item.move_to_testing_or_deploy

 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end	


 	end 

 	def inp_back

 		@item.back_to_inp

 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end	
 	end  

 	def completed_move

 		@item.move_to_completed

 		if @item.save
 			redirect_to project_item_path(@project, @milestone)
 		else
 				
 			redirect_to project_item_path(@project, @milestone) 	
 		end				
 	end   		  	  	 		

 	def get_item_data
 		@project = Project.find(params[:project_id])
 		@item = Item.find(params[:id])
 		@milestone = @item.milestone
 	end

 	def destroy
 		@item = Item.find(params[:id])
		@item.destroy
		redirect_to project_item_path(@project, @milestone), notice: 'Project berhasil di hapus' 	
 	end

	private

	def resources_params
		params.require(:item).permit(:list, :task_id, :milestone_id)
	end	

end