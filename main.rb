require 'rubygems'
require 'sinatra'

get '/CreateSession' do
  content_type 'application/xml', :charset => 'utf-8'
  builder :create_session
end
