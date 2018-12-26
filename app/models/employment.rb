class Employment < ApplicationRecord
	belongs_to :employmentable, :polymorphic =>true
	

	enum status: {invited:0, active:1, hold:2 }
end
