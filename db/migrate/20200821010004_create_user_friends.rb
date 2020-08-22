class CreateUserFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :user_friends do |t|
      t.integer :user_id, index: true, foreign_key: true
      t.integer :friend_user_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
