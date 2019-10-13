class Workout < ApplicationRecord
  
  validates :user_id, presence: true
  validates :description, presence: true
  # validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :likes
end
