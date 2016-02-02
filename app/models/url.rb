require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	def shorten
		# Url.to_a
		# Array.new(7){['a'..'z', 'A'..'Z','0'..'9'].sample}
		self.shorten = SecureRandom.hex(7)
		
	end
end
