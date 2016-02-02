# require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_create :shorten # Call back method

	def shorten

		self.short_url = SecureRandom.urlsafe_base64(7)
	end
end
