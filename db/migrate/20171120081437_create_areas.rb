class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.integer :leader
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
