require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('returns the name of a given instance of the Stylist class') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      expect(stylist.name()).to(eq('Austin Kincaid'))
    end
  end

  describe('#save') do
    it('saves a specified instance of the Stylist class') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('.all') do
    it('returns an empty array if no instances have been saved to the database') do
      expect(Stylist.all()).to(eq([]))
    end

    it('returns all instances of the Stylist class if instances are saved') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
      stylist2.save()
      expect(Stylist.all()).to(eq([stylist, stylist2]))
    end
  end

  describe('#==') do
    it('equates instances of the custom class Stylists in such a way that Rspec can handle') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('.find') do
    it('finds an instance of the Stylist class by the id') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
      stylist2.save()
      stylist3 = Stylist.new({:id => nil, :name => 'Joshua Oppenheimer'})
      stylist3.save()
      expect(Stylist.find(stylist2.id())).to(eq(stylist2))
    end
  end

  describe('#delete') do
    it('deletes a specific instance of the Stylist class') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
      stylist2.save()
      stylist3 = Stylist.new({:id => nil, :name => 'Joshua Oppenheimer'})
      stylist3.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2, stylist3]))
    end
  end

  describe('#update') do
    it('updates a given instance of the Stylist class') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
      stylist2.save()
      stylist2.update({:name => "Ira Glass"})
      expect(stylist2.name()).to(eq("Ira Glass"))
    end
  end

  describe(:clients) do
    it('displays all client names of a given instance of the Stylist class') do
      stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
      stylist.save()
      client = Client.new({:id => nil, :name => 'Sam Harris', :stylist_id => stylist.id()})
      client.save()
      expect(stylist.clients()).to(eq([client]))
    end
  end
end
