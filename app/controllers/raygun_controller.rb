class RaygunController < ApplicationController
  def index
  end
  
  def list
    url = URI.parse('https://webapi.raygun.io/applications/890013125/errors/all')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    raygun_response = http.get(url.request_uri, {
      'X-ApiKey' => 'PgxyazCgTksjtQwStyRkvw==',
    })

    render json: JSON.parse(raygun_response.body)
  end
end
