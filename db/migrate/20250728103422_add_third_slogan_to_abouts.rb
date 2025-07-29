class AddThirdSloganToAbouts < ActiveRecord::Migration[7.1]
  def change
    add_column :abouts, :third_slogan, :string
  end
end
