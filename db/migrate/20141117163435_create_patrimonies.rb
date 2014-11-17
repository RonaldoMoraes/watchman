class CreatePatrimonies < ActiveRecord::Migration
  def change
    create_table :patrimonies do |t|
      t.string :name
      t.string :identifier
      t.string :status
      t.text :description
      t.references :responsible
      t.references :room

      t.timestamps
    end
  end
end
