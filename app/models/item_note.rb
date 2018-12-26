class ItemNote < ApplicationRecord
	belongs_to :itemable, :polymorphic =>true
end
