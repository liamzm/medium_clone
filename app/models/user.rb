class User < ActiveRecord::Base
	has_secure_password

	has_many :comments
	has_many :articles

	acts_as_voter

	mount_uploader :avatar, AvatarUploader

	enum user_type: [:user, :admin]

	# attr_accessible :email, :password, :first_name, :last_name

	validates_uniqueness_of :email

	validate :password_complexity

	def password_complexity
    return if password.blank? || password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/

    errors.add :password, 'Complexity requirement not met. Minimum eight characters, at least one letter and one number'
  end

	include PgSearch
  	multisearchable :against => [:first_name, :last_name]

  	def self.rebuild_pg_search_documents
    	find_each { |record| record.update_pg_search_document }
	end
end

