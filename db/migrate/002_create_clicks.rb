class CreateClicks < ActiveRecord::Migration
  def self.up
    create_table :clicks do |t|
      t.integer  "link_id",    :limit => 10, :default => 0,  :null => false
      t.datetime "created_at",                               :null => false
      t.string   "ip",         :limit => 45, :default => "", :null => false
    end
  end

  def self.down
    drop_table :clicks
  end
end
