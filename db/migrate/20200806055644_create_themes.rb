class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.text :title, null:false
      t.text :image 
      t.string :answer1, null:false, default: "Yes"
      t.string :answer2, null:false, default: "No"
      t.integer :genre, null:false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
