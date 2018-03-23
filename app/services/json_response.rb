module JsonResponse

  def conn
    Faraday.new(url: "https://api.github.com", headers: token)
  end

  def token
    {"access_token" => user.oauth_token} if user.class == User
  end

  def json_response(uri, header = {})
    response = send_request(uri, header)
    JSON.parse(response.body, symbolize_names: true)
  end

  def response_headers(uri, header = {})
    response = send_request(uri, header)
    response.headers[:link]
  end

  def send_request(uri, header = {})
    response = conn.get do |req|
      req.url uri
      req.headers[header.keys.first] = header.values.first
    end
  end

end
