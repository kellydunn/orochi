class ParentMigration < ActiveRecord::Migration
  def self.up
    # add_column :routes, :rerouter_id, :integer, :refrences => metaclass.class.to_s.pluralize
  end

  def self.down
    # remove_column :routes, :rerouter_id
  end
end
