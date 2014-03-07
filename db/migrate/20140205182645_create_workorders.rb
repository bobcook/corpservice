class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |t|
      t.string :number
      t.string :po
      t.string :estimate_id
      t.string :line_item
      t.integer :quantity
      t.float :price
      t.string :previous_action
      t.date :next_action_due
      t.date :schedule
      t.date :invoice
      t.float :invoice_total
      t.text :notes
      t.belongs_to :franchise, index: true
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
