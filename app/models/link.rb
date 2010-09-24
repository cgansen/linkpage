class Link < ActiveRecord::Base
  acts_as_list
  
  has_many :clicks, :dependent => :destroy
  
  before_create :set_clicks_to_zero

  def last_click
    updated_at
  end
  
  def total_clicks
    self.clicks.size
  end

  protected
  def set_clicks_to_zero
    self.click_count = 0
  end
end
