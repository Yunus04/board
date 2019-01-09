class ItemController < ApplicationController

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
 		@project = Project.find(params[:project_id])

 		@item = Item.find(params[:id])

 		@item.move_to_analysis_or_design

 			if @item.save
 				redirect_to project_item_path(@project)
 			else
 					
 				redirect_to project_item_path(@project) 

 		end
 	end

 	def back_requirement
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.back_to_requirement

 			if @item.save
 				redirect_to project_item_path(@project)
 			else
 					
 				redirect_to project_item_path(@project) 

 		end
 	end

 	def worked_move
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.move_to_requirement_or_worked

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project) 	
 		end	
 	end

 	def back_analysis
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.back_to_analysis_or_design

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project)
 		end
 	end 

 	def inp_move
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.move_to_inp

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project)
 		end
 	end 

 	def worked_back
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.back_to_requirement_or_worked

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project)
 		end
 	end 

 	def deploy_move
 		@project = Project.find(params[:project_id])
 		
 		@item = Item.find(params[:id])
 		@item.move_to_testing_or_deploy

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project)
 		end


 	end 

 	def inp_back
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.back_to_inp

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project)
 		end
 	end  

 	def completed_move
 		@project = Project.find(params[:id])
 		
 		@item = Item.find(params[:id])
 		@item.back_to_inp

 		if @item.save
 			redirect_to project_item_path(@project)
 		else
 				
 			redirect_to project_item_path(@project)
 		end 			
 	end   		  	  	 		

	private

	def resources_params
		params.require(:item).permit(:list, :task_id, :milestone_id)
	end	

end