require 'spec_helper'

describe InspectionCreator do
  it "creates inspections" do
    inspection = {"address" => "123 Test Street", "aka_name" => "Test Restaurant", "inspection_id" => "123"}
    some_other_inspection = {"address" => "123 Test Street", "aka_name" => "Test Restaurant", "inspection_id" => "456"}
    InspectionCreator.create_inspections([inspection, some_other_inspection])

    Inspection.all.count.should == 2
  end

  it "does not create duplicate inspections" do
    inspection = {"address" => "123 Test Street", "aka_name" => "Test Restaurant", "inspection_id" => "123"}

    InspectionCreator.create_inspections([inspection])
    InspectionCreator.create_inspections([inspection])

    Inspection.all.count.should == 1
  end
end
