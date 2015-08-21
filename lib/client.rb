class Client
  attr_reader(:id, :name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM clients;")
    all_clients = []
    results.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      all_clients.push(Client.new({:id => id, :name => name, :stylist_id => stylist_id}))
    end
    all_clients
  end

  define_method(:==) do |other_client|
    self.id().==(other_client.id()).&(self.name().==(other_client.name())).&(self.stylist_id().==(other_client.stylist_id()))
  end

  define_singleton_method(:find) do |client_id|
    found_client = nil
    Client.all().each() do |client|
      if client.id() == client_id
        found_client = client
      end
    end
    found_client
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE clients SET stylist_id = '#{@stylist_id}' WHERE id = #{@id};")
  end
end
