class Theme < ApplicationRecord

  belongs_to :user
  has_many :answers

  def self.search(search)
    if search
      Theme.where('title LIKE(?)', "%#{search}%")
    else
      Theme.all
    end
  end

end
