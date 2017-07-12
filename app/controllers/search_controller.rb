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
      repid = representative[:id]
      name = representative[:name]
      role = representative[:role]
      party = representative[:party]
      seniority = representative[:seniority]
      district = representative[:district]

    end

  end
end

