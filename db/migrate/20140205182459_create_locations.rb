class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.belongs_to :client, index: true

      t.timestamps
    end
  end
end
