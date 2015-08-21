require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require('pg')

DB = PG.connect({:dbname => "hair_salon_test"})

get("/") do
  @stylists = Stylists.all()
  @clients = Clients.all()
  erb(:index)
end

# post("/") do
#
#   @stylists = Stylists.all()
#   @clients = Clients.all()
#   erb(:index)
# end
