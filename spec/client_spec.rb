require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the name of a given instance of the Client class') do
      client = Client.new({:id => nil, :name => 'Austin Kincaid', :stylist_id => 1})
      expect(client.name()).to(eq('Austin Kincaid'))
    end
  end

  describe('#save') do
    it('saves a specified instance of the Client class') do
      client = Client.new({:id => nil, :name => 'Austin Kincaid', :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe('.all') do
    it('returns an empty array if no instances have been saved to the database') do
      expect(Client.all()).to(eq([]))
    end

    it('returns all instances of the Client class if instances are saved') do
      client = Client.new({:id => nil, :name => 'Austin Kincaid', :stylist_id => 1})
      client.save()
      client2 = Client.new({:id => nil, :name => 'Sam Harris', :stylist_id => 2})
      client2.save()
      expect(Client.all()).to(eq([client, client2]))
    end
  end

  describe('#==') do
    it('equates instances of the custom class Clients in such a way that Rspec can handle') do
      client = Client.new({:id => nil, :name => 'Austin Kincaid', :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe('.find') do
    it('finds an instance of the Stylist class by the id') do
      client = Client.new({:id => nil, :name => 'Austin Kincaid', :stylist_id => 1})
      client.save()
      client2 = Client.new({:id => nil, :name => 'Sam Harris', :stylist_id => 2})
      client2.save()
      client3 = Client.new({:id => nil, :name => 'Joshua Oppenheimer', :stylist_id => 1})
      client3.save()
      expect(Client.find(client.id())).to(eq(client))
    end
  end

  # describe('#delete') do
  #   it('deletes a specific instance of the Stylist class') do
  #     stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
  #     stylist.save()
  #     stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
  #     stylist2.save()
  #     stylist3 = Stylist.new({:id => nil, :name => 'Joshua Oppenheimer'})
  #     stylist3.save()
  #     stylist.delete()
  #     expect(Stylist.all()).to(eq([stylist2, stylist3]))
  #   end
  # end
  #
  # describe('#update') do
  #   it('updates a given instance of the Stylist class') do
  #     stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
  #     stylist.save()
  #     stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
  #     stylist2.save()
  #     stylist2.update({:name => "Ira Glass"})
  #     expect(stylist2.name()).to(eq("Ira Glass"))
  #   end
  # end
end
