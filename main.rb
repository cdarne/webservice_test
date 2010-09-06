require 'rubygems'
require 'sinatra'
require 'builder'

require 'errors'

configure :development do
  disable :show_exceptions
end

$JEU_JACK = "7488"
$JEU_QUIZZ = "7489"

before do
  content_type 'application/xml', :charset => 'utf-8'
end

def pre_process_action
  missing_parameters = []
  ['V_SERVICEID', 'V_CUSTOMERLABEL'].each do |param|
    if !params[param]
      missing_parameters << param
    else
      instance_variable_set "@#{param}".to_sym, params[param]
    end
  end
  
  if missing_parameters.size > 0
    raise SMSAdminErrors::MissingParameters.new(missing_parameters)
  elsif @V_SERVICEID !~ /^\d{4}$/
    raise SMSAdminErrors::InvalidServiceId
  elsif ![$JEU_JACK, $JEU_QUIZZ].include? @V_SERVICEID
    raise SMSAdminErrors::UnknownService
  end
end


get '/CreateSession' do
  pre_process_action
  builder :create_session
end


get '/GetNextStep' do
  pre_process_action
  missing_parameters = []
  ['V_SESSIONID', 'V_MSISDN'].each do |param|
    if !params[param]
      missing_parameters << param
    else
      instance_variable_set "@#{param}".to_sym, params[param]
    end
  end

  @V_ADDRESS = params['V_ADDRESS']
  
  if missing_parameters.size > 0
    e = SMSAdminErrors::MissingParameters.new(missing_parameters)
    raise e
  else
    
    if @V_MSISDN.gsub(/\s/, '') !~ /^(06|336)\d{8}$/
      raise SMSAdminErrors::WrongMSISDNFormat
    end
    
    if params[:won]
      builder :get_next_step_won
    elsif params[:won_ask_address]
      builder :get_next_step_won_ask_address
    elsif params[:won_waiting_address]
      builder :get_next_step_won_waiting_address
    elsif params[:won_valid_address]
      builder :get_next_step_won_valid_address
    else
      builder :get_next_step_lose
    end
  end
end

get '/CloseSession' do
  pre_process_action
    missing_parameters = []
  ['V_SESSIONID'].each do |param|
    if !params[param]
      missing_parameters << param
    else
      instance_variable_set "@#{param}".to_sym, params[param]
    end
  end

  if missing_parameters.size > 0
    e = SMSAdminErrors::MissingParameters.new(missing_parameters)
    raise e
  else
    builder :close_session
  end
end

not_found do
  content_type 'application/xml', :charset => 'utf-8'
  builder :'errors/unknown_action'
end

error SMSAdminErrors::InvalidServiceId do
  builder :'errors/invalid_service_id'
end

error SMSAdminErrors::UnknownService do
  builder :'errors/unknown_service'
end

error SMSAdminErrors::MissingParameters do
  @missing_parameters = request.env['sinatra.error'].missing_parameters
  builder :'errors/missing_parameters'
end

error SMSAdminErrors::WrongMSISDNFormat do
  builder :'errors/wrong_msisdn_format'
end

error do
  builder :'errors/internal_error'
end