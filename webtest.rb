require 'sinatra'

get '/' do
  content_type :text
  'Hello World!'
end

get '/type/text' do
  content_type :text
  'Hello Text World!'
end

get '/type/html' do
  content_type :html
  '<h1>Hello HTML World!</h1>'
end

get '/type/json' do
  content_type :json
  '{"message":"Hello JSON World!"}'
end
