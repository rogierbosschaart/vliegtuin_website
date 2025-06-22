class CreateProfilePages < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_pages do |t|
      t.string :naam
      t.string :email
      t.text :info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
