class CreateHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies do |t|
      t.string :name, null: false
      t.string :description
      t.belongs_to :person

      t.timestamps
    end
  end
end
