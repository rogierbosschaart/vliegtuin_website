class AddSecondSloganToAbouts < ActiveRecord::Migration[7.1]
  def change
    add_column :abouts, :second_slogan, :string
  end
end
