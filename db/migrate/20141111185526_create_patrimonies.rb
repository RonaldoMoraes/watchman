class CreatePatrimonies < ActiveRecord::Migration
  def change
    create_table :patrimonies do |t|
      t.string :name
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
