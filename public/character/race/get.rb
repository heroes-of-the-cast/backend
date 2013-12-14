require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'

# All API methods
module API
	# Static API methods on characters
	module Character
		# API methods on character races
		module Race
			extend self
			# Gets a race by alias
			#
			# @param [String] _alias
			# @return [Race] the requested race
			def getrace _alias
				Races.get _alias
			end
		end
	end
end
