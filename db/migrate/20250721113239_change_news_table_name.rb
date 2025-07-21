class ChangeNewsTableName < ActiveRecord::Migration[7.1]
  def change
    rename_table :news, :news_items
  end
end
