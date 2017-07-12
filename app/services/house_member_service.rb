class HouseMemberService

  def initialize(state)
    @state = state
    @uri = "https://api.propublica.org/congress/v1/members/house/#{state}/current.json"
  end

  def house_members
    connection = Faraday.new(uri)
    connection.headers['X-API-KEY'] = ENV['congress_api_key']
    response = connection.get
    result = JSON.parse(response.body, symbolize_names: true)
    result[:results]
  end

  private
    attr_reader :state, :uri
end