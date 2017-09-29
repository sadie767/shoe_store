require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

get('/') do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/stores') do
  @id = params[:id]
  @store = params['store']
  @input = Store.new({:id => nil, :store => @store})
  @input.save()
  @stores = Store.all
  erb(:index)
end

get('/stores/:id/edit') do
  @id = params['id']
  @get_id = Store.find(params.fetch('id').to_i)
  erb(:store_edit)
end

patch('/stores/:id/update') do
  @store = params['store']
  @get_id = Store.find(params.fetch('id').to_i)
  @get_id.update({:store => @store})
  erb(:store_edit)
end

delete('/stores/:id/delete') do
  @id = params[:id]
  @get_id = Store.find(params.fetch('id').to_i)
  @get_id.delete
  @stores = Store.all
  erb(:index)
end

post('/brands') do
  @id = params[:id]
  @brand = params['brand']
  @price = params['price']
  @input = Brand.new({:id => nil, :brand => brand, :price => @price})
  @input.save
  @brands = Brand.all
  erb(:index)
end
