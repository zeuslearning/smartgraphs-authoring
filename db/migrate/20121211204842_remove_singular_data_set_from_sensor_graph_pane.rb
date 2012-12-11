class RemoveSingularDataSetFromSensorGraphPane < ActiveRecord::Migration
  def self.up
    remove_index :sensor_graph_panes, :name => :index_sensor_graph_panes_on_data_set_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_index :sensor_graph_panes, [:data_set_id]
  end
end
