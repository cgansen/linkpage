class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string   "text",                      :default => "", :null => false
      t.string   "url",                       :default => "", :null => false
      t.datetime "updated_at",                                :null => false
      t.datetime "created_at",                                :null => false
      t.integer  "position",    :limit => 10, :default => 0,  :null => false
      t.integer  "click_count"
    end
  end

  def self.down
    drop_table :links
  end
end
