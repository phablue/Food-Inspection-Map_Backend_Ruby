require './lib/inspection_creator'

task :get_inspections do
  inspections = InspectionCreator.get_inspections
  InspectionCreator.create_inspections(inspections)
  p Inspection.all.count
end
