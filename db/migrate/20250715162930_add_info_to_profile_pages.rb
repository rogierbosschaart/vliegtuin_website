class AddInfoToProfilePages < ActiveRecord::Migration[7.1]
  def change
    add_column :profile_pages, :beroep, :string
    add_column :profile_pages, :instagram, :string
    add_column :profile_pages, :facebook, :string
    add_column :profile_pages, :pinterest, :string
    add_column :profile_pages, :linkedin, :string
    add_column :profile_pages, :website, :string
  end
end
