class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.integer :area_id
      t.string :speciality
      t.integer :yearsexperience
      t.float :salary
    end
  end
end
