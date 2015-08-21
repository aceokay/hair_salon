require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the name of a given instance of the Client class') do
      client = Client.new({:id => nil, :name => 'Austin Kincaid', :stylist_id => 1})
      expect(client.name()).to(eq('Austin Kincaid'))
    end
  end

  # describe('#save') do
  #   it('saves a specified instance of the Stylist class') do
  #     stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
  #     stylist.save()
  #     expect(Stylist.all()).to(eq([stylist]))
  #   end
  # end
  #
  # describe('.all') do
  #   it('returns an empty array if no instances have been saved to the database') do
  #     expect(Stylist.all()).to(eq([]))
  #   end
  #
  #   it('returns all instances of the Stylist class if instances are saved') do
  #     stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
  #     stylist.save()
  #     stylist2 = Stylist.new({:id => nil, :name => 'Sam Harris'})
  #     stylist2.save()
  #     expect(Stylist.all()).to(eq([stylist, stylist2]))
  #   end
  # end
  #
  # describe('#==') do
  #   it('equates instances of the custom class Stylists in such a way that Rspec can handle') do
  #     stylist = Stylist.new({:id => nil, :name => 'Austin Kincaid'})
  #     stylist.save()
  #     expect(Stylist.all()).to(eq([stylist]))
  #   end
  # end
end
