class CreateDungeons < ActiveRecord::Migration[7.0]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.boolean :deadly
      t.integer :adventurers_claimed

      t.timestamps
    end
  end
end
