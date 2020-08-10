class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :answer, null: false
      t.timestamps
    end
  end
end
