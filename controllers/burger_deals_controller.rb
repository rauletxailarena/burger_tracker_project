require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/burger'
require_relative '../models/eatery'
require_relative '../models/deal'
require_relative '../models/burger_deal'
require 'pry'

get '/deals/:id/burger_deals/new' do
  @deal = Deal.find_by_id(params['id'])
  @eatery = @deal.eatery
  erb(:"burger_deals/new")
end

post '/deals/:id/burger_deals' do

  deal_id = Deal.find_by_name(params['deal_name']).id
  params['deal_id'] = deal_id

  @burger_deal = BurgerDeal.new(params)
  @burger_deal.save

  erb(:"burger_deals/create")


end