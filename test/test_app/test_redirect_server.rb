require 'sinatra'

get '/ok' do
  status 200
end

get '/redirect' do
  redirect '/ok'
end

get '/redirect_permanant' do
  redirect '/ok', 301
end

get '/not_found' do
  status 404
end

get '/gone' do
  status 410
end

get '/custom_header' do
  headers['X-One-Million-Years'] = 'Dungeon'
  status 200
end


