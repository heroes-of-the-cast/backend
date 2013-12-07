require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'

# API methods on characters
module Character
	# API methods on character races
	module Race
		extend self
		# Gets a race by alias
		#
		# @param [String] _alias
		# @return [Race] the requested race
		def getrace _alias
			(Races.get _alias).to_json
		end
	end
end
