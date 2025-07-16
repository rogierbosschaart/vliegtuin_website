class ProfilePage < ApplicationRecord
  belongs_to :user
  has_one_attached :banner_image
  has_many_attached :images
end
