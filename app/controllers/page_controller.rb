class PageController < ApplicationController
  helper :page
  verify :method => :post, :only => [:remove_link, :add_link]

  def index
    redirect_to :action => 'home'
  end
  
  def home
    @links = Link.find(:all, :order => :created_at)
    return if not @links.any?
    
    @max, @min, @divisor = get_link_cloud_data(@links)
  end

  def add_link
    @link = Link.new(params[:link])
    @link.save!
    @links = Link.find(:all)
    @max, @min, @divisor = get_link_cloud_data(@links)
    render :partial => 'link', :collection => @links
  end

  def click_link
    link = Link.find(params[:id])
    click = Click.new(:ip => request.remote_ip)
    link.clicks << click
    link.increment!(:click_count)
    redirect_to link.url
  end

  def remove_link
    Link.destroy(params[:id])
    render :nothing => true
  end
  
  protected
  
  def get_link_cloud_data(links)
    max = min = links.first.click_count
    links.each do |link|
      max = link.click_count if !link.click_count.nil? and link.click_count > max
      min = link.click_count if !link.click_count.nil? and link.click_count < min
    end
    divisor = ((max - min) / 7) + 1 # TODO: replace 7 with the sizes array size itself              
    return max, min, divisor
  end

end
