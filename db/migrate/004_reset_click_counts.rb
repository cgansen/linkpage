class ResetClickCounts < ActiveRecord::Migration
  def self.up
    links = Link.find(:all)
    links.each do |link|
      link.click_count = link.clicks.count
      link.save
    end

  end

  def self.down
  end
end
