class ProfilePage < ApplicationRecord
  extend FriendlyId
  friendly_id :naam, use: :slugged
  belongs_to :user
  has_one_attached :banner_image, dependent: :destroy
  has_one_attached :profile_image, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  validates :user, presence: true
  validates :naam, presence: true
  validates :beroep, presence: true
  validates :banner_image, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
  validates :profile_image, presence: true, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
end
