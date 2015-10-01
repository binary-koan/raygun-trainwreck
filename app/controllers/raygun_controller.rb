class RaygunController < ApplicationController
  def index
  end
  
  def list
    # Easiest to request the list here and send it (avoids cross-domain errors etc.)
    url = URI.parse('https://webapi.raygun.io/applications/890013125/errors/all?sortBy=recent')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    raygun_response = http.get(url.request_uri, {
      # Hmm ... what havoc can you wreak with my API key?
      'X-ApiKey' => 'PgxyazCgTksjtQwStyRkvw==',
    })

    render json: JSON.parse(raygun_response.body)
  end
end
