class AddSelectedToNews < ActiveRecord::Migration[7.1]
  def change
    add_column :news, :selected, :boolean, default: false
  end
end
