class CreateRdvs < ActiveRecord::Migration[7.0]
  def change
    create_table :rdvs do |t|
      t.date :date
      t.references :doctor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
