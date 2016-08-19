class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.string :hair_color
      t.string :eye_color
      t.integer :age, null: false
      t.integer :weight
      t.string :height

      t.timestamps
    end
  end
end
