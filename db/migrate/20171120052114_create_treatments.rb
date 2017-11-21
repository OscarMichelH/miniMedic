class CreateTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :treatments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :duration
      t.string :medicaments
      t.string :prescription

      t.timestamps
    end
  end
end
