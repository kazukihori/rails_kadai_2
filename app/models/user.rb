class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
         

  validates :name, presence: true

  mount_uploader :image, ImageUploader

def show
  @user = User.find(id:params[id])
end
end
