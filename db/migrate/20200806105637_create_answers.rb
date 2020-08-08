class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :theme_id, null:false
      t.integer :user_id, null:false
      t.string :answer, null: false
      t.timestamps
    end
  end
end
