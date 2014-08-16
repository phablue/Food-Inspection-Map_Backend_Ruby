class Inspection
  include DataMapper::Resource

  property :id,              Serial
  property :address,         String
  property :aka_name,        String
  property :city,            String
  property :dba_name,        String
  property :facility_type,   String
  property :inspection_date, String
  property :inspection_id,   String
  property :inspection_type, String
  property :latitude,        String
  property :license_,        String
  property :longitude,       String
  property :results,         String
  property :risk,            String
  property :state,           String
  property :violations,      Text, :length => 500000
  property :zip,             String

  validates_uniqueness_of :inspection_id
end
