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
	
	# @returns [CharClass] A strength focussed class
	def self.Clasher
		CharClasses::get "clasher"
	end
	
	# @returns [CharClass] A speed focussed class
	def self.Chaser
		CharClasses::get "chaser"
	end
	
	# @returns [CharClass] A serenity focussed class
	def self.Concentrator
		CharClasses::get "concentrator"
	end
	
	# @returns [CharClass] A stamina focussed class
	def self.Conserver
		CharClasses::get "conserver"
	end
	
	# @returns [CharClass] A sorcery focussed class
	def self.Caster
		CharClasses::get "caster"
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
			ret = CharClass.make(cclass, "Neutral", "Nothing", Stats.create(:strength => 1,:speed => 1,:serenity => 1,:stamina => 1,:sorcery => 1))
		when "clasher"
			ret = CharClass.make(cclass, "Clasher", "Clashers do not evade confrontation, the key to a good defense is a strong offence.", 
									Stats.create(:strength =&gt; 2,:speed =&gt; 1,:serenity =&gt; 1,:stamina =&gt; 1,:sorcery =&gt; 1))
		when "chaser"
			ret = CharClass.make(cclass, "Chaser", "Chasers pursue their enemies and take advantage of their superior speed in battle.", 
									Stats.create(:strength =&gt; 1,:speed =&gt; 2,:serenity =&gt; 1,:stamina =&gt; 1,:sorcery =&gt; 1))
		when "concentrator"
			ret = CharClass.make(cclass, "Concentrator", "Concentrators will not lose focus, their attacks are decisive", 
									Stats.create(:strength =&gt; 1,:speed =&gt; 1,:serenity =&gt; 2,:stamina =&gt; 1,:sorcery =&gt; 1))
		when "conserver"
			ret = CharClass.make(cclass, "Conserver", "Conservers are efficient contenders and are often able to emerge victorious through endurance.", 
									Stats.create(:strength =&gt; 1,:speed =&gt; 1,:serenity =&gt; 1,:stamina =&gt; 2,:sorcery =&gt; 1))
		when "caster"
			ret = CharClass.make(cclass, "Caster", "Casters are masters of non-physical attacks, beware their power.", 
									Stats.create(:strength =&gt; 1,:speed =&gt; 1,:serenity =&gt; 1,:stamina =&gt; 1,:sorcery =&gt; 2))
		end
		
		ret
	end
	
	private :make
end
