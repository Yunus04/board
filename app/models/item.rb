class Item < ApplicationRecord
	include AASM

	belongs_to :milestone
	belongs_to :task

	#enum list: { requirement:0,  analysis_or_design:1, requirement_or_worked:2, inp:3, 	testing_or_deploy:4, completed:5 }

  aasm  :column => 'list' do
    state :requirement, :initial => true
    state :analysis_or_design, :requirement_or_worked, :inp, :testing_or_deploy, :completed

    event :move_to_analysis_or_design do
      transitions :from => :requirement, :to => :analysis_or_design
    end

    event :back_to_requirement do
      transitions :from => :analysis_or_design, :to => :requirement
    end    


    event :move_to_requirement_or_worked do
      transitions :from => :analysis_or_design, :to => :requirement_or_worked
    end

    event :back_to_analysis_or_design do
      transitions :from => :requirement_or_worked, :to => :analysis_or_design
    end 


    event :move_to_inp do
      transitions :from => :requirement_or_worked, :to => :inp
    end

    event :back_to_requirement_or_worked do
      transitions :from => :inp, :to => :requirement_or_worked
    end


    event :move_to_testing_or_deploy do
      transitions :from => :inp, :to => :testing_or_deploy
    end 

    event :back_to_inp do
      transitions :from => :testing_or_deploy, :to => :inp
    end


    event :move_to_completed do
      transitions :from => :testing_or_deploy, :to => :completed
    end 

  end

end
