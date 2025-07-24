class NewsItem < ApplicationRecord
  belongs_to :user
  has_one_attached :news_item_image

  validates :info, presence: true
  validates :title, uniqueness: true, presence: true
  validates :news_item_image, presence: true, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
end
