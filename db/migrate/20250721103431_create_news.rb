class CreateNews < ActiveRecord::Migration[7.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :info
      t.string :slogan

      t.timestamps
    end
  end
end
