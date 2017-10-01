require('spec_helper')

describe(Brand) do
  it { should have_many(:stores) }

  it("ensures an empty field inputted by  user will not be saved for brand") do
    brand = Brand.new({:brand => ''})
    expect(brand.save()).to(eq(false))
  end

  it("ensures an empty field inputted by user will not be saved for price") do
    price = Brand.new({:price => ''})
    expect(price.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    brand = Brand.new({:brand => "a".*(101)})
    expect(brand.save()).to(eq(false))
  end

  it('ensures that all brand names are unique') do
      brand1 = Brand.new({:brand => "Sas"})
      brand2 = Brand.new({:brand => "Sas"})
      brand1.save
      expect(brand2.save).to(eq(false))
    end

  describe('.first_letter') do
    it('should take user input and uppercase the first letter of each word.') do
    input = Brand.new(:brand => 'gatorz')
    input.save
    expect(input.first_letter()).to(eq('Gatorz'))
    end
  end

end
