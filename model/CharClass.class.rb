# Character Class
#
# @author Tim van Dalen
class CharClass < StatModifyingProperty
end

# Collection of defined [CharClass]s
module CharClasses
	# Returns aliases for all known classes
	#
	# @return [Array<String>] aliases of all known classes
	def self.all
		["neutral", "clasher", "chaser", "concentrator", "conserver", "caster"]
	end
	
	# Returns a list of all known classes
	#
	# @return [Array<CharClass>] all known classes
	def self.list
		ret = []
		CharClasses::all.each do |ralias|
			ret << CharClasses::get(ralias)
		end
		ret
	end

	# Makes a new CharClass
	# This should only be called when a CharClass doesn't exist yet, no further checks will be done
	#
	# @param [String] cclass alias of the CharClass you want to create (which should not yet exist in the database)
	# @return [CharClass] the cclass you wanted to create
	def self.make cclass
		case cclass
		when "neutral"
			ret = CharClass.make(cclass, "Neutral", "Nothing", Stats.new(:strength => 1,:speed => 1,:serenity => 1,:stamina => 1,:sorcery => 1))
		when "clasher"
			ret = CharClass.make(cclass, "Clasher", "Clashers do not evade confrontation, the key to a good defense is a strong offence.", 
									Stats.new(:strength => 2,:speed => 1,:serenity => 1,:stamina => 1,:sorcery => 1))
		when "chaser"
			ret = CharClass.make(cclass, "Chaser", "Chasers pursue their enemies and take advantage of their superior speed in battle.", 
									Stats.new(:strength => 1,:speed => 2,:serenity => 1,:stamina => 1,:sorcery => 1))
		when "concentrator"
			ret = CharClass.make(cclass, "Concentrator", "Concentrators will not lose focus, their attacks are decisive", 
									Stats.new(:strength => 1,:speed => 1,:serenity => 2,:stamina => 1,:sorcery => 1))
		when "conserver"
			ret = CharClass.make(cclass, "Conserver", "Conservers are efficient contenders and are often able to emerge victorious through endurance.", 
									Stats.new(:strength => 1,:speed => 1,:serenity => 1,:stamina => 2,:sorcery => 1))
		when "caster"
			ret = CharClass.make(cclass, "Caster", "Casters are masters of non-physical attacks, beware their power.", 
									Stats.new(:strength => 1,:speed => 1,:serenity => 1,:stamina => 1,:sorcery => 2))
		end
		
		ret
	end

	# @return [CharClass] A totally neutral cclass that does nothing
	def self.Neutral
		CharClasses::get "neutral"
	end
	
	# @return [CharClass] A strength focussed class
	def self.Clasher
		CharClasses::get "clasher"
	end
	
	# @return [CharClass] A speed focussed class
	def self.Chaser
		CharClasses::get "chaser"
	end
	
	# @return [CharClass] A serenity focussed class
	def self.Concentrator
		CharClasses::get "concentrator"
	end
	
	# @return [CharClass] A stamina focussed class
	def self.Conserver
		CharClasses::get "conserver"
	end
	
	# @return [CharClass] A sorcery focussed class
	def self.Caster
		CharClasses::get "caster"
	end
	
	# Gets a class
	#
	# @param [String] cclass alias of the CharClass you want to get
	# @return [CharClass] the requested class
	def self.get cclass
		ret = CharClass.first(:alias => cclass)
		if ret.nil?
			ret = CharClasses::make cclass
		end
		ret
	end
end
