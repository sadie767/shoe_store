require('spec_helper')

# As a user, I want to be able to add, update, delete and list shoe stores.
describe 'the store creation path', {:type => :feature} do
    it 'allows the user to add and list shoe stores.' do
      test_store = Store.new({:store => 'Foot Fervor', :id => nil})
      test_store.save
      visit '/'
      fill_in('store', :with => 'Foot Fervor')
      click_button('Add Store')
      expect(page).to have_content('Foot Fervor')
  end
end

describe 'the store update path', {:type => :feature} do
  it 'allows a user to change the name of the store' do
    test_store = Store.new({:store => 'Foot Fervor', :id => nil})
    test_store.save
    visit '/'
    click_link('Foot Fervor')
    fill_in('store', :with => 'Foot Frenzy')
    click_button('Update Store')
    expect(page).to have_content('Foot Frenzy')
  end
end

describe 'the store delete path', {:type => :feature} do
  it 'allows a user to delete a store' do
    test_store = Store.new({:store => 'Foot Fervor', :id => nil})
    test_store.save
    visit '/'
    click_link('Foot Fervor')
    click_button('Delete Store')
    visit '/'
    expect(page).not_to have_content("Foot Fervor")
  end
end
