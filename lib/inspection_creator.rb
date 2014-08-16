require 'httparty'
require 'json'
require './dmconfig'

class InspectionCreator
  def self.create_inspections(inspections)
    inspections.each do |inspection|
      Inspection.create(inspection)
    end
  end

  def self.standardize_inspections(parsed_inspections)
    parsed_inspections.inject([]) do |acc, inspection|
      acc << {
        "address"         => inspection.fetch("address", ""),
        "aka_name"        => inspection.fetch("aka_name", ""),
        "city"            => inspection.fetch("city", ""),
        "dba_name"        => inspection.fetch("dba_name", ""),
        "facility_type"   => inspection.fetch("facility_type", ""),
        "inspection_date" => inspection.fetch("inspection_date", ""),
        "inspection_id"   => inspection.fetch("inspection_id", ""),
        "inspection_type" => inspection.fetch("inspection_type", ""),
        "latitude"        => inspection.fetch("latitude", ""),
        "license_"        => inspection.fetch("license_", ""),
        "longitude"       => inspection.fetch("longitude", ""),
        "results"         => inspection.fetch("results", ""),
        "risk"            => inspection.fetch("risk", ""),
        "state"           => inspection.fetch("state", ""),
        "violations"      => inspection.fetch("violations"),
        "zip"             => inspection.fetch("zip", "")
      }
    end
  end

  def self.get_inspections
    inspections = HTTParty.get("https://data.cityofchicago.org/resource/4ijn-s7e5.json?$where=violations%20IS%20NOT%20NULL%20AND%20inspection_date%20%3E=%20%272014-01-01%27")
    standardize_inspections(JSON.parse(inspections.body))
  end
end
