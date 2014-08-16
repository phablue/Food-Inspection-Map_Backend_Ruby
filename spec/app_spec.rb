require 'spec_helper'
require 'app'
require 'rack/test'

describe 'GrossKitchenBackend' do
  include Rack::Test::Methods

  def app
    GrossKitchenBackend
  end

  it "returns all inspections" do
    inspection = {"address" => "123 Test Street", "aka_name" => "Test Restaurant", "inspection_id" => "123"}
    other_inspection = {"address" => "123 Test Street", "aka_name" => "Test Restaurant", "inspection_id" => "456"}
    Inspection.create(inspection)
    Inspection.create(other_inspection)

    get '/all_inspections'

    inspections = JSON.parse(last_response.body)

    last_response.should be_ok
    inspections.count.should == 2

    first_inspection = inspections.first
    first_inspection["address"].should == inspection["address"]
    first_inspection["aka_name"].should == inspection["aka_name"]
    first_inspection["inspection_id"].should == inspection["inspection_id"]
  end
end
