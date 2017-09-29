require('spec_helper')

describe(Brand) do
  it { should have_many(:stores) }

  describe('.letter') do
    it('should take user input and uppercase the first letter of each word.') do
    input = Brand.new(:brand => 'gatorz')
    input.save
    expect(input.letter()).to(eq('Gatorz'))
    end
  end

end
