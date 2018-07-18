class Article < ActiveRecord::Base

	belongs_to :user
	has_many :comments

	mount_uploader :image, ImageUploader

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	acts_as_votable

	validates_uniqueness_of :title

	# validate :valid_city

	include PgSearch
	multisearchable :against => [:title, :subhead, :address, :content]

  	def self.rebuild_pg_search_documents
    	find_each { |record| record.update_pg_search_document }
	end


	# def valid_city
 #    return if address.blank? || address =~ /^[a-z][a-z\s]*$/

 #    errors.add :address, 'Invalid city name'
 #  end


	

end