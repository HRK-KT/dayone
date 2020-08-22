class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.integer :from_user_id, index: true, foreign_key: true
      t.integer :to_user_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
