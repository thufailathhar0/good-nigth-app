class CreateSleeps < ActiveRecord::Migration[7.2]
  def change
    create_table :sleeps do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :clock_in
      t.datetime :clock_out
      t.timestamps
    end
  end
end
