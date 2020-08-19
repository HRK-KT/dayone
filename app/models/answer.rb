class Answer < ApplicationRecord

belongs_to :user
belongs_to :theme
has_many :comments

validates :user_id, uniqueness: { scope: :theme_id } 

end
