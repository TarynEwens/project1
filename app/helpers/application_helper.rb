module ApplicationHelper

 # Helper to create dynamic page title - every page title defined on each view will be followed by the base title
  def full_title(page_title = '')
    base_title = "WOOFER - Woof at your Doggo friends!"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
