# require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, presence: true, format: { with: /(http:\/\/|https:\/\/|ftp:\/\/)?(www.)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix, message:"Is this even a website?" }
	# validates :short_url, presence: true, format: { with: }
	before_create :shorten # Call back method

	def shorten
		self.short_url = SecureRandom.urlsafe_base64(7)
	end

	def update_click_count
		self.click_count += 1
		self.save
	end
end
