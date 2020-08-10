class AddIndexThemeIdAndUserIdToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_index :answers, [:theme_id, :user_id], :unique => true
  end
end
