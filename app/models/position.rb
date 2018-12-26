class Position < ApplicationRecord

	belongs_to :user
	belongs_to :team

	enum position: {employee:0, admin:1, tester:2, contractor:3 }
end
