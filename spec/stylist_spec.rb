require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it("returns the name of a given instance of the Stylist class") do
      stylist = Stylist.new({:id => nil, :name => "Austin Kincaid"})
      expect(stylist.name()).to(eq("Austin Kincaid"))
    end
  end
end
