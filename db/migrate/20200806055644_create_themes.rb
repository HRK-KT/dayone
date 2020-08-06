class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.text :title, null:false
      t.text :image 
      t.string :answer1, null:false, default: "Yes"
      t.string :answer2, null:false, default: "No"
      t.integer :genre, null:false
      t.integer :created_user_id, null:false

      t.timestamps
    end
  end
end
