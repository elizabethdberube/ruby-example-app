class AddUserId < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :users, foreign_key: true
  end
end
