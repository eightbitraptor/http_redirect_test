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
end

get '/gone' do
end

get '/custom_header' do
end


