# @author Nathaniel Jones
#
# Courtesy of nthj https://gist.github.com/nthj/1009737
 
class Password < String
	class Invalid < Exception; end
	
	class << self
		def from_mongo value
			new value.to_s
		end
		
		def hash password
			Digest::SHA256::hexdigest password
		end
	end
	
	def eql? password
		if hashed? 
			self.class.hash(password) == to_s
		else
			password == to_s
		end if password
	end
	alias :== :eql?
 
	def hash!
		replace self.class.hash self unless hashed? if present?
	end
	
	def hashed?
		length == 64
	end
 
	def inspect
		'********'
	end
end
