class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :account
      t.string :contact
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
