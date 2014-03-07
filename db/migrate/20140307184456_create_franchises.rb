class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :number
      t.string :name
      t.string :phone
      t.string :email
      t.integer :location_id

      t.timestamps
    end
  end
end
