# require 'byebug'

get '/' do
	@urls = Url.all
	@error = params['error'] # Woll print out the error message
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
	# create new url
	@new_url = Url.new(long_url: params[:long_url])
	if @new_url.save
		redirect '/' # Redirect users to a new page
	else
		@errors = @new_url.errors.messages[:long_url].to_s
		# After the ? will be params and the @errors will be hash
		redirect "/?error=#{@errors}" 
	end

	
end

get '/success' do
	erb :"static/success"
end


get '/:short_url' do # put : will become params
	@url = Url.find_by(short_url: params[:short_url])
	@url.update_click_count
	redirect "#{@url.long_url}"
end

=begin
get '/:name' #status, if users type any string in the end of the url it will pass this method
	@name = params[:name]
	erb: "static/success"	
end	
=end
