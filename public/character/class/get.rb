require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'CharClass.class.rb'

# API methods on characters
module Character
	# API methods on character classes
	module Class
		extend self
		# Gets a class by alias
		#
		# @param [String] _alias
		# @return [CharClass] the requested class
		def getclass _alias
			(CharClasses.get _alias).to_json
		end
	end
end
