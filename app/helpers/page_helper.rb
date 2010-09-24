module PageHelper

  def link_title_text(link)
    if link.last_click
      pluralize(link.click_count, 'click')
    else
      'No clicks'
    end
  end

  def sizes
    ['smaller', 'small', 'medium', 'big', 'bigger', 'huge', 'gigantic']    
  end
  
end
