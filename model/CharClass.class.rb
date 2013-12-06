# Character Class
#
# @author Tim van Dalen
class CharClass < StatModifyingProperty
end

# Collection of defined [CharClass]s
module CharClasses
	# @returns [CharClass] A totally neutral cclass that does nothing
	def self.Neutral
		CharClasses::get "neutral"
	end
	
	# Gets a class
	#
	# @param [String] class alias of the CharClass you want to get
	# @returns [CharClass] the requested class
	def self.get cclass
		ret = CharClass.first(:alias => cclass)
		if ret.nil?
			ret = make cclass
		end
		ret
	end
	
	# Makes a new CharClass
	# This should only be called when a CharClass doesn't exist yet, no further checks will be done
	#
	# @param [String] cclass alias of the CharClass you want to create (which should not yet exist in the database)
	# @param [CharClass] the cclass you wanted to create
	def make cclass
		case cclass
		when "neutral"
			ret = CharClass.create(
				:alias => "neutral",
				:name => "Neutral",
				:description => "Nothing",
				:modifiers => Stats.create(
					:strength => 1,
					:speed => 1,
					:serenity => 1,
					:stamina => 1,
					:magic => 1
				)
			)
		end
		
		ret
	end
	
	private :make
end
