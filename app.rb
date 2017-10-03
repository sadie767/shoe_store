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
  if @input.save()
    redirect('/')
  else
    erb(:errors_stores)
  end
end


patch('/stores/:id/update') do
  @store = params['store']
  @get_id = Store.find(params.fetch('id').to_i)
  @get_id.update({:store => @store})
  redirect('/')
end

delete('/stores/:id/delete') do
  @id = params[:id]
  @get_id = Store.find(params.fetch('id').to_i)
  @get_id.delete
  @stores = Store.all
  redirect('/')
end

post('/brands') do
  @brands = Brand.all
  @id = params[:id]
  @brand = params['brand']
  @price = params['price']
  @input = Brand.new({:id => nil, :brand => @brand, :price => @price})
  if @input.save()
    redirect('/')
  else
    erb(:errors_brands)
  end
end

get('/stores/:id/edit') do
  @id = params['id']
  @brand = params['brand']
  @get_id = Store.find(params.fetch('id').to_i)
  @brands = Brand.all
  erb(:store_edit)
end


post('/add_brands/:id') do
  @get_id = Store.find(params.fetch('id').to_i)
  @brand = params['brand']
  redirect('/store_edit/#{@get_id.id}')
end


get('/stores/:id/shoes') do
  @id = params['id']
  @get_brand = Brand.find(params.fetch('id').to_i)
  @brands = Brand.all
  erb(:shoe_stores)
end
