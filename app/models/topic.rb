class Topic < ApplicationRecord
  
  validates :user_id, presence: true
  validates :description, presence: true
  validetes :image, presence: true
  
  belongs_to :user
end
