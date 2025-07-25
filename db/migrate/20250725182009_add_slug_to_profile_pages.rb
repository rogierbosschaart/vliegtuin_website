class AddSlugToProfilePages < ActiveRecord::Migration[7.1]
  def change
    add_column :profile_pages, :slug, :string
    add_index :profile_pages, :slug, unique: true
  end
end
