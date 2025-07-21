class AddColumnsToAbouts < ActiveRecord::Migration[7.1]
  def change
    add_column :abouts, :adres, :string
    add_column :abouts, :email, :string
  end
end
