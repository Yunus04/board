class Employment < ApplicationRecord
	belongs_to :employable, :polymorphic =>true
	has_many :member_employments
	belongs_to :project

	enum status: {invited:0, active:1, hold:2 }
end
