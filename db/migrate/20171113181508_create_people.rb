class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.actable
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :gender

      t.timestamps
    end
  end
end
