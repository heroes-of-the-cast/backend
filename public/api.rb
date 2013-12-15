get '/' do
	"Not yet implemented"
end

# Creates a new user
#
# @param [String] username the name for the new user
# @param [String] password new password, unhashed
# @raise [APIError] if the username is a reserved word or if a user by that name already exists
# @return [User] the newly recreated user
post '/user/create' do
	content_type :json
	require_relative 'user/create.rb'
	
	API::UserMethods::create(params[:username], params[:password]).to_json
end

# Gets new user
#
# @param [String] name the name to search for
# @raise [APIError] if no such user exists
# @return [User] the requested user
get '/user/:name' do
	content_type :json
	require_relative 'user/get.rb'
	
	API::UserMethods::get(params[:name]).to_json
end

# Logs a user in
#
# @param [String] username the name of the user
# @param [String] password that users password, unhashed
# @raise [APIError] if the credentials are wrong
# @return [Session] new session with a key in it
post '/user/login' do
	content_type :json
	require_relative 'user/login.rb'
	
	API::UserMethods::login(params[:username], params[:password], request.user_agent, request.ip).to_json
end

# Creates a new character
#
# @param [String] username the user for which to create this character
# @param [String] name name of the character
# @param [String] race race alias of the character
# @param [String] class class alias of the character
# @param [String] session_key valid Session key
# @return [Character] the newly created character
post '/user/:username/character/create' do
	content_type :json
	require_relative 'user/helpers/auth.rb'
	require_relative 'user/character/create.rb'

	#TODO: stop assuming that :username is always me here

	API::UserMethods::CharacterMethods::create(params[:name], params[:race], params[:class], params[:session_key]).to_json
end

# Gets all characters for a user
#
# @param [String] username the user to get all chars for
# @return [Array<Character>] all characters for that user
get '/user/:username/character/list' do
	content_type :json
	require_relative 'user/character/list.rb'

	API::UserMethods::CharacterMethods::list(params[:username]).to_json
end

# Gets a character
#
# @param [String] username the user to which the character belongs
# @param [String] charname the name of the character
# @return [Character] the requested character
get '/user/:username/character/:charname' do
	content_type :json
	require_relative 'user/character/get.rb'

	API::UserMethods::CharacterMethods::get(params[:username], params[:charname]).to_json
end

get '/character/race/list' do
	content_type :json
	require_relative 'character/race/list.rb'

	API::Character::Race::getlist.to_json
end

get '/character/race/:alias' do
	content_type :json
	require_relative 'character/race/get.rb'
	
	API::Character::Race::getrace(params[:alias]).to_json
end

get '/character/class/list' do
	content_type :json
	require_relative 'character/class/list.rb'
	
	API::Character::Class::getlist.to_json
end

get '/character/class/:alias' do
	content_type :json
	require_relative 'character/class/get.rb'
	
	API::Character::Class::getclass(params[:alias]).to_json
end
