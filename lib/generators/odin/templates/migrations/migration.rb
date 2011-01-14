class OdinMigration < ActiveRecord::Migration
  def self.up
    create_table :routers do |t|
      t.string :start
      t.string :stop
      t.timestamps
    end
    
    create_table :routes do |t|
      t.integer :router_id, :references => :routers
      t.timestamps
    end

    create_table :legs do |t|
      t.integer :route_id, :references => :routes
      t.timestamps
    end

    create_table :steps do |t|
      t.integer :leg_id, :references => :legs
      t.text :polyline_json
      t.text :directions_json
      t.timestamps
    end
  end

  def self.down
    drop_table :routers
    drop_table :routes
    drop_table :legs
    drop_table :steps
  end
end
