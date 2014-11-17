class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :identifier
      t.string :name
      t.string :email
      t.date :birth
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
