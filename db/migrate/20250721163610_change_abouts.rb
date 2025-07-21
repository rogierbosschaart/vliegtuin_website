class ChangeAbouts < ActiveRecord::Migration[7.1]
  def change
    rename_column :abouts, :info, :first_info
    add_column :abouts, :second_info, :text
  end
end
