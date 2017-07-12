class SearchController < ApplicationController
  def index
    state = params[:state]
    Representative.build_representatives_for(state)
    @representatives = Representative.get_representatives_for(state)
  end
end

