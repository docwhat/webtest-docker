require 'sinatra'
require 'json'

ERROR_CODES = {
  400 => 'Bad Request',
  401 => 'Unauthorized',
  403 => 'Forbidden',
  404 => 'Not Found',
  405 => 'Method Not Allowed',
  406 => 'Not Acceptable',
  418 => "I'm a teapot (RFC 2324)"
}

TYPES = {
  text: 'Hello Text World!',
  html: '<h1>Hello HTML World!</h1>',
  json: '{"message":"Hello JSON World!"}'
}

get '/' do
  haml :index, format: :html5
end

TYPES.each_pair do |sym, body|
  get "/type/#{sym}" do
    content_type sym
    body
  end
end

ERROR_CODES.each_pair do |code, text|
  get "/code/#{code}" do
    content_type :json
    halt(
      code,
      { code: code, message: text }.to_json
    )
  end
end
