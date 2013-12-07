get '/' do
	"Not yet implemented"
end

get '/character/race/list' do
	content_type :json
	require_relative 'character/race/list.rb'
	
	getlist
end

get '/character/race/:alias' do
	content_type :json
	require_relative 'character/race/get.rb'
	
	getrace params[:alias]
end

get '/character/class/list' do
	content_type :json
	require_relative 'character/class/list.rb'
	
	getlist
end

get '/character/class/:alias' do
	content_type :json
	require_relative 'character/class/get.rb'
	
	getclass::q params[:alias]
end
