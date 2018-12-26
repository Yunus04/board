class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :positions
         has_many :teams, throught: :positions
         has_many :member_employments
         has_many :employments, :as => :employmentable

 
end




