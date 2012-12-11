class RemoveSingularDataSetPartTwo < ActiveRecord::Migration
  def self.up
    remove_column :sensor_graph_panes, :data_set_id
  end

  def self.down
    add_column :sensor_graph_panes, :data_set_id, :integer
  end
end
