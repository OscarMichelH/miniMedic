class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
