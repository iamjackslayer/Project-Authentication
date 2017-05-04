class User < ApplicationRecord
	has_many :posts
	has_secure_password
	before_create :remember_user

	def remember_user
		self.remember_token = create_token
	end

	def create_token
		Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
	end
end
