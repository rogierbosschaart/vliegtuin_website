class AddSloganToAbouts < ActiveRecord::Migration[7.1]
  def change
    add_column :abouts, :slogan, :string
  end
end
