class Article < ActiveRecord::Base

	belongs_to :user
	has_many :comments

	acts_as_votable

	include PgSearch
	multisearchable :against => [:title, :subhead, :content]

  	def self.rebuild_pg_search_documents
    	find_each { |record| record.update_pg_search_document }
	end

end