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
end
