class User < ActiveRecord::Base
	has_secure_password

	has_many :comments
	has_many :articles

	acts_as_voter

	# attr_accessible :email, :password, :first_name, :last_name

	validates_uniqueness_of :email

	include PgSearch
  	multisearchable :against => [:first_name, :last_name]

  	def self.rebuild_pg_search_documents
    	find_each { |record| record.update_pg_search_document }
	end
end

