class About < ApplicationRecord
  validate :only_one_record, on: :create
  has_one_attached :about_image

  private

  def only_one_record
    if About.count > 0
      errors.add(:base, "An About record already exists. You can only edit the existing one.")
    end
  end
end
