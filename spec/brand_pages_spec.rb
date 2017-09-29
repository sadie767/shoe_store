require('spec_helper')

describe 'the shoe-brand path', {:type => :feature} do
  it 'shows shoe brands entered by users the prices' do
    test_brand = Brand.new({:brand => 'Italo-boogalo', :price => '75', :id => nil})
    test_brand.save
    visit "/"
    fill_in('brand', :with => 'Italo-boogalo')
    click_button('Add Brand')
    expect(page).to have_content('Italo-boogalo')
  end
end
