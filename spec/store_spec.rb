require('spec_helper')

describe(Store) do
  it { should have_many(:brands) }

  describe('.letter') do
    it('should take user input and uppercase the first letter of each word.') do
    input = Store.new(:store => 'shoe and glove shack')
    input.save
    expect(input.letter()).to(eq('Shoe And Glove Shack'))
    end
  end
end
