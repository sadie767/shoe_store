require('spec_helper')

describe(Store) do
  it { should have_many(:brands) }

  it("ensures an empty field inputted by  user will not be saved") do
    store = Store.new({:store => ''})
    expect(store.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    store = Store.new({:store => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

  it('ensures that all store names are unique') do
      store1 = Store.new({:store => "Footies"})
      store2 = Store.new({:store => "Footies"})
      store1.save
      expect(store2.save).to(eq(false))
    end

  describe('.first_letter') do
    it('should take user input and uppercase the first letter of each word.') do
    input = Store.new(:store => 'shoe and glove shack')
    input.save
    expect(input.first_letter()).to(eq('Shoe And Glove Shack'))
    end
  end
end
