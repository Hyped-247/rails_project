class AddUserIdToArticles < ActiveRecord::Migration
  def change
    # The foreign key has to be of type int.
    add_column :articles, :user_id, :integer
  end
end
