class AddNaamToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :naam, :string
    add_reference :news_items, :user, foreign_key: true
  end
end
