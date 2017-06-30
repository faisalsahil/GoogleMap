class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :name
      t.text :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
