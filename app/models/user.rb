class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password # Adds functions and validators and attr info
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, :presence => true,
					  :uniqueness => { :case_sensitive => false },
					  :format => { :with => email_regex }
	
	validates_presence_of :name

	validates_presence_of :password, :on => :create

end
