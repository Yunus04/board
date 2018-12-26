class Item < ApplicationRecord
	belongs_to :milestone
	belongs_to :task

	enum list: { requirement:0,  analysis_or_design:1, requirement_or_worked:2, inp:3, 	testing_or_deploy:4, completed:5 }
end
