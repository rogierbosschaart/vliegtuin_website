class About < ApplicationRecord
  validate :only_one_record, on: :create
  has_one_attached :about_image
  has_one_attached :about_second_image
  has_one_attached :about_third_image
  has_one_attached :about_home_image

  validates :about_image, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
  validates :about_second_image, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
  validates :about_third_image, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }
  validates :about_home_image, size: { less_than: 2.megabytes, message: 'must be less than 2MB' }

  private

  def only_one_record
    if About.count > 0
      errors.add(:base, "An About record already exists. You can only edit the existing one.")
    end
  end
end
