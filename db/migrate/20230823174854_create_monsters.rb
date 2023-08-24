class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.boolean :intelligent
      t.boolean :hostile
      t.integer :pack_size

      t.timestamps
    end
  end
end
