# Represents a logged in user session
class Session
	include MongoMapper::Document
	
	# @return [String] the session key
	key :key, String
	
	# @return [String] user agent of the device that requested this session
	key :device, String
	
	# @return [String] IP address of the connection that requested this session TODO: make IP type
	key :ip, String
	
	# @return [User] the user that is using this session
	belongs_to :user
	
	# Generates a new key
	#
	# @param [String] username name of the user
	# @return [String] newly generated key
	def self.generate_key username
		#TODO: In the light of the source being available: is this truly unpredictable just because of the rand statements?
		#TODO: Also, collisions?
		Digest::SHA256::hexdigest(Digest::SHA256::hexdigest(Time.now.to_s + username + rand(1000).to_s) + Digest::SHA256::hexdigest(Time.now.to_s + username + rand(4000).to_s))
	end
	
	# Hash representation of this session
	#
	# @return [Hash] representation of this session, to be JSONified
	def as_json(options={})
		super({ :only => [:key, :device, :ip] })
	end
end

Session.ensure_index [[:key, 1]], :unique => true
