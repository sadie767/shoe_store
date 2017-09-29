require('spec_helper')

# As a user, I want to be able to add, update, delete and list shoe stores.
describe 'the store creation path', {:type => :feature} do
    it 'allows the user to add and list shoe stores.' do
      visit '/'
      fill_in('store', :with => 'Foot Fervor')
      click_button('Add Store')
      expect(page).to have_content('Foot Fervor')
  end
end
