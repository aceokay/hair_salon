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

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end
end
