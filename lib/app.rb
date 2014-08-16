require 'sinatra'
require 'json'
require './dmconfig'

class GrossKitchenBackend < Sinatra::Base

  get '/all_inspections' do
    all_inspections = Inspection.all
    all_inspections.to_json
  end
end
