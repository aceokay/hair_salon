require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require('pg')

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post("/") do
  # stylist_name = params.fetch('stylist_name')
  # client_name = params.fetch('client_name')
  # stylist_id = params.fetch('stylist_id')

  if params.fetch('stylist_name', :nil => nil).is_a?(String)
    stylist_name = params.fetch('stylist_name')
    new_stylist = Stylist.new({:id => nil, :name => stylist_name})
    new_stylist.save()
  elsif params.fetch('client_name', :nil => nil).is_a?(String)
    client_name = params.fetch('client_name')
    stylist_id = params.fetch('stylist_id')
    new_client = Client.new({:id => nil, :name => client_name, :stylist_id => stylist_id})
    new_client.save()
  end

  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
