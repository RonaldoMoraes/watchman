class CreateMigrations < ActiveRecord::Migration
  def change
    create_table :migrations do |t|
      t.string :identifier
      t.string :locale
      t.integer :capacity
      t.boolean :lab

      t.timestamps
    end
  end
end
