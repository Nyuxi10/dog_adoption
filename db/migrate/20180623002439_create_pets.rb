#name age gender photo breed and location

class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :breed
      t.string :location
      t.timestamps
    end
  end
end
