module StaticHelper

  def make_request(search_term)
    resp = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=#{search_term}&maxResults=10"
    JSON.parse(resp.body)
  end

  def parse_books(json)
    json["items"].map do |item|
      item["volumeInfo"]
    end
  end



end
