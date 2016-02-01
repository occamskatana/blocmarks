class AddBookmarkToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :bookmark, index: true, foreign_key: true
  end
end
