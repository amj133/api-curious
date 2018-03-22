module JsonResponse

  def conn
    Faraday.new(url: "https://api.github.com", headers: token)
  end

  def token
    {"access_token" => user.oauth_token}
  end

  def json_response(uri, header = {})
    response = conn.get do |req|
      req.url uri
      req.headers[header.keys.first] = header.values.first
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
