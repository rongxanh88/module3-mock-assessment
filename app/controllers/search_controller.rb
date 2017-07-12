class SearchController < ApplicationController
  def index
    state = params[:state]
    uri = "https://api.propublica.org/congress/v1/members/house/#{state}/current.json"
    connection = Faraday.new(uri)
    connection.headers['X-API-KEY'] = ENV['congress_api_key']
    response = connection.get
    result = JSON.parse(response.body, symbolize_names: true)
    representatives = result[:results]

   representatives.each do |representative|
      rep = Representative.find_or_create_by(repid: representative[:id])
      rep.name = representative[:name]
      rep.role = representative[:role]
      rep.party = representative[:party]
      rep.seniority = representative[:seniority].to_i
      rep.district = representative[:district].to_i
      rep.state = state
      rep.save
    end

    @representatives = Representative.where(state: state)
    binding.pry 
    "hello"
  end
end

