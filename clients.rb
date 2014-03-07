require "CSV"
  CSV.foreach("Clients.csv") do |row|
    account = row[0]
    contact = row[1]
    phone   = row[2]
    email   = row[3]
    Client.create(account: account, contact: contact, phone: phone, email: email)
    
  end