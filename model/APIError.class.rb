# Known API error
#
# Codes:
#     1:
#         type: UserExistsError
#         description: Thrown when someone wants to create a user with a name that already exists
#         params: [0: name]
#     11:
#         type: ReservedNameError
#         description: Thrown when someone wants to create something with a reserved name
#         params: [0: name]
#     12:
#         type: UserNotFoundError
#         description: Thrown when someone tries to query a user that doesn't exist
#         params: [0: name]
#     13:
#         type: LoginError
#         descript: Thrown when login credentials aren't correct
#         params: []
#     2:
#         type: CharExistsError
#         description: Thrown when someone wants to create a character with a name that already exists for that user
#         params: [0: username, 1: characteralias]
class APIError
	# @return [FixNum] error code
	attr_reader :code
	
	# @return [String] type associated with this error code
	attr_reader :type
	
	# @return [String] extra explanation for the error
	attr_reader :message
	
	# Create a new error
	#
	# @param [FixNum] code the code of this error
	# @param [Array] params extra params for the error
	# @return [APIError] the created error
	def initialize(code, params)
		@code = code
		
		case @code
		when 1
			@type = "UserExistsError"
			@message = "User #{params[0]} already exists in the system"
		when 11
			@type = "ReservedNameError"
			@message = "Name #{params[0]} is reserved"
		when 12
			@type = "UserNotFoundError"
			@message = "User #{params[0]} doesn't exist"
		when 13
			@type = "LoginError"
			@message = "Wrong credentials"
		when 2
			@type = "CharExistsError"
			@message = "Character #{params[1]} for user #{params[0]} already exists in the system"
		else
			raise "error code not known: #{code}"
		end
	end

	# Hash representation of this error
	#
	# @return [Hash] representation of this error, to be JSONified
	def as_json(options={})
		{
			'error' => {
				'message' => @message,
				'type' => @type,
				'code' => @code
			}
		}
	end
end
