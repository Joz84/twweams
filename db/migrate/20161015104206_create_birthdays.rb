class CreateBirthdays < ActiveRecord::Migration[5.0]
  def change
    create_table :birthdays do |t|
      t.date :birthdate
      t.time :birthtime

      t.timestamps
    end
  end
end
