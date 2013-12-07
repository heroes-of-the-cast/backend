require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'CharClass.class.rb'

# API methods on characters
module Character
	# API methods on character classes
	module Class
		extend self
		# Gets all classes
		#
		# @return [Array<CharClass>] all known classes
		def getlist
			CharClasses.list.to_json
		end
	end
end
