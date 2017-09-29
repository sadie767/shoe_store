require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

get('/') do
  @stores = Store.all
  @brands = Brand.all
end

post('/stores') do
  id = params[:id]
  @store = params['store']
  @input = Store.new({:id => nil, :store => store})
  @input.save
  @stores = Store.all
end
