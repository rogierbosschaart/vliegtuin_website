class AddActiveToProfilePages < ActiveRecord::Migration[7.1]
  def change
    add_column :profile_pages, :active, :boolean, default: true
  end
end
