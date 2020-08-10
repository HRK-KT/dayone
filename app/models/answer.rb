class Answer < ApplicationRecord

belongs_to :user
belongs_to :theme

validates :answer,　uniqueness: { scope: [:theme_id, :user_id] } 

end
