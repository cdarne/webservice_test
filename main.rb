require 'rubygems'
require 'sinatra'
require 'builder'

$JEU_JACK = "7488"
$JEU_QUIZZ = "7489"

get '/CreateSession' do
  content_type 'application/xml', :charset => 'utf-8'
  missing_parameters = []
  ['V_SERVICEID', 'V_CUSTOMERLABEL'].each do |param|
    if !params[param]
      missing_parameters << param
    else
      instance_variable_set "@#{param}".to_sym, params[param]
    end
  end
  
  if missing_parameters.size > 0
    builder :create_session_missing_parameters
  elsif @V_SERVICEID !~ /^\d{4}$/
    builder :create_session_invalid_service_id
  elsif ![$JEU_JACK, $JEU_QUIZZ].include? @V_SERVICEID
    builder :create_session_unknown_service
  elsif params[:internal_error]
    builder :create_session_internal_error
  else
    builder :create_session
  end
end
