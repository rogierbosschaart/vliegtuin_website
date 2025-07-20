class AddPhoneNumberToProfilePage < ActiveRecord::Migration[7.1]
  def change
    add_column :profile_pages, :phone_number, :string
  end
end
