json.array!(@workorders) do |workorder|
  json.extract! workorder, :id, :number, :po, :estimate_id, :line_item, :quantity, :price, :previous_action, :next_action_due, :schedule, :invoice, :invoice_total, :notes, :franchise_id, :location_id
  json.url workorder_url(workorder, format: :json)
end
