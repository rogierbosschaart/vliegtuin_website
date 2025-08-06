class Event < ApplicationRecord
  has_one_attached :card_image

  validates :title, presence: true
  validates :description, presence: true
  validates :card_image, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
end
