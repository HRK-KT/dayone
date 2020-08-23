class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, UserUploader

  has_many :themes
  has_many :answers
  has_many :comments

  has_many :likes

  has_many :group_users
  has_many :group, through: :group_users
  has_many :messages

end
