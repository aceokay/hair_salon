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

get('/stylists/:id') do
  stylist_id = params.fetch('id').to_i()
  @stylist = Stylist.find(stylist_id)
  @clients = @stylist.clients()
  erb(:stylist_info)
end

patch('/stylists/:id') do
  stylist_id = params.fetch('id').to_i()
  stylist = Stylist.find(stylist_id)
  new_name = params.fetch('name')
  stylist.update({:name => new_name})
  @stylist = Stylist.find(stylist_id)
  @clients = @stylist.clients()
  erb(:stylist_info)
end

delete('/stylist/:id') do
  stylist_id = params.fetch('id').to_i()
  stylist = Stylist.find(stylist_id)
  stylist.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/clients/:id') do
  client_id = params.fetch('id').to_i()
  @client = Client.find(client_id)
  @stylist = Stylist.find(@client.stylist_id())
  erb(:client_info)
end

patch('/clients/:id') do
  client_id = params.fetch('id').to_i()
  client = Client.find(client_id)
  new_name = params.fetch('name')
  client.update({:name => new_name})
  @client = Client.find(client_id)
  @stylist = Stylist.find(@client.stylist_id())
  erb(:client_info)
end

delete('/clients/:id') do
  client_id = params.fetch('id').to_i()
  client = Client.find(client_id)
  client.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
