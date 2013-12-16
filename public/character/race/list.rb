require 'Stats.class.rb'
require 'StatModifyingProperty.class.rb'
require 'Race.class.rb'

# All API methods
module API
	# Static API methods on characters
	module CharacterMethods
		# API methods on character races
		module Race
			extend self
			# Gets all races
			#
			# @return [Array<Race>] all known races
			def getlist
				Races.list
			end
		end
	end
end
