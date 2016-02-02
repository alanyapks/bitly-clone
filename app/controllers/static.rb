require 'sinatra'

get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do
	# create new url
	@new_url = Url.new(long_url: params[:long_url]).save
end

get '/:short_url' do
	Url.shorten 
	# Redirect to appropriate "Long" url
	redirect '/urls'
end