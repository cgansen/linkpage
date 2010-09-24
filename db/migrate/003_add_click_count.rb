class AddClickCount < ActiveRecord::Migration
  def self.up
		add_column :links, :click_count, :integer
		
		Link.find(:all).each do |link|
			link.click_count = link.clicks.count
			link.save
		end
  end

  def self.down
  	remove_column :links, :click_count
	end
end
