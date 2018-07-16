class SearchResultsController < ApplicationController
	def index
		@pg_search_documents = PgSearch.multisearch(params[:search])
		@article_results = @pg_search_documents.select {|x| x.searchable_type == "Article"}
		@user_results = @pg_search_documents.select {|x| x.searchable_type == "User"}
	end
end
