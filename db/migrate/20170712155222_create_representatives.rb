class CreateRepresentatives < ActiveRecord::Migration[5.1]
  def change
    create_table :representatives do |t|
      t.text :repid
      t.text :name
      t.text :role
      t.text :party
      t.integer :seniority
      t.integer :district
      t.text :state

      t.timestamps
    end
  end
end
