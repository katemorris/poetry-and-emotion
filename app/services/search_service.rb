class SearchService
  def self.poems_by_author(author_search)
    response = connection.get("/author/#{author_search}")
    json_body = JSON.parse(response.body, symbolize_names: true)
    json_body.nil? ? [] : json_body
  end

  private

  def self.connection
    Faraday.new('https://poetrydb.org/')
  end
end
