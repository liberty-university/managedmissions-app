require 'rest_client'
require 'sinatra'

ENDPOINT = 'https://missions.managedministries.com'

def send_proxy_response proxy_response
  proxy_response.cookies.each do |name, value|
    response.set_cookie(name, value: value, path: '/', expires: Time.new(2020, 1, 1))
  end
  content_type proxy_response.headers[:content_type]
  body proxy_response.body
end

get '/api/auth/logon' do
  uri = URI.parse(ENDPOINT)
  uri.path = '/api/auth/logon'
  uri.query = request.query_string
  send_proxy_response RestClient.post(uri.to_s, params, cookies: request.cookies)
end

get '/*' do
  uri = URI.parse(ENDPOINT)
  uri.path = request.path
  send_proxy_response RestClient.get(uri.to_s, params: params, cookies: request.cookies)
end
