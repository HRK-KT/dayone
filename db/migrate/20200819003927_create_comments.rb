class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :theme, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
