class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message, null:false
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.text :image
      t.timestamps
    end
  end
end
