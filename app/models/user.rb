class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :positions
         has_many :projects
         has_many :teams, through: :positions
         has_many :member_employments
         has_many :employments, :as => :employable

 
end




