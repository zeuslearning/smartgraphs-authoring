class DataSetSensorGraph < ActiveRecord::Base

  hobo_model # Don't put anything above this

  include SgPermissions
  sg_parent :sensor_graph_pane

  fields do
    timestamps
  end

  belongs_to :data_set
  belongs_to :sensor_graph_pane
end
