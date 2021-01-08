class SearchController < ApplicationController
  def index
    @poems = SearchFacade.get_poems(params[:author])
  end
end
