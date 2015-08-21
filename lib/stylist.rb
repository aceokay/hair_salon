class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM stylists;")
    all_stylists = []
    results.each() do |stylist|
      id = stylist.fetch('id').to_i()
      name = stylist.fetch('name')
      all_stylists.push(Stylist.new({:id => id, :name => name}))
    end
    all_stylists
  end

  define_method(:==) do |other_stylist|
    self.id().==(other_stylist.id()).&(self.name().==(other_stylist.name()))
  end

  define_singleton_method(:find) do |stylist_id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id() == stylist_id
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()}")
  end

  define_method(:clients) do
    stylist_clients = []
    returned_clients = DB.exec("Select * FROM clients WHERE stylist_id = #{self.id()};")
    returned_clients.each() do |client|
      id = client.fetch('id').to_i()
      name = client.fetch('name')
      stylist_id = client.fetch('stylist_id').to_i()
      stylist_clients.push(Client.new({:id => id, :name => name, :stylist_id => stylist_id}))
    end
    stylist_clients
  end
end
