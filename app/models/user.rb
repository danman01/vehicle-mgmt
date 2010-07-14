class User < ActiveRecord::Base
  set_primary_keys :myid
	has_many :trips
	has_many :reservations
	belongs_to :group
	#require ldapp_conn
	
	user_groups=[]
	groups = Group.all
	for g in groups do
	  user_groups << g.name
	end
	  validates_presence_of :myid, :user_fname, :user_lname, :user_group
	  validates_inclusion_of :user_group, :in => user_groups
	  
	  #trying ldap authentication
	  
	#def self.ldap_authenticate(login, password)
    # Allow 'classic' login method
    #if find_by_login(login)
    #  return User.authenticate(login, password)
    #else
    #if u = find_by_ldap_account(login.upcase)
    #  return (ldap_authenticated?(login,password) ? u : nil)
   # else
    #  return nil
    #end
  #end

	validates_presence_of :myid
	validates_uniqueness_of :myid
	
	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	#validate :password_non_blank
	
	def password
		@password
	end
	
	def password=(pwd)
		@password = pwd
		return if pwd.blank?
		create_new_salt
		self.hashed_password = User.encrypted_password(self.password, self.salt)
	end
	
	def self.authenticate(myid, password)
		user = self.find_by_myid(myid)
		
		if user
			if user.hashed_password.blank?
			user
			else
			expected_password = encrypted_password(password, user.salt) 
				if user.hashed_password != expected_password
					user = nil
				end
			end
		end
		user
	end

	
private
	
	def password_non_blank
		errors.add(:password, "cannot be blank") if hashed_password.blank?
	end
	
	def self.encrypted_password(password, salt)
		string_to_hash = password + "wibble" + salt
		Digest::SHA1.hexdigest(string_to_hash)
	end
	
	def create_new_salt
		self.salt= self.object_id.to_s + rand.to_s
	end


end


# == Schema Information
#
# Table name: users
#
#  myid       :string(40)
#  user_fname :string(50)
#  user_lname :string(50)
#  user_email :string(50)
#  user_group :string(25)
#  role       :text            default("normal")
#  logged_in  :integer         default(0)
#  password   :text
#

