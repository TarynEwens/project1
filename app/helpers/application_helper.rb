module ApplicationHelper

  def full_title(page_title = '')
    base_title = "WOOFER - Woof at your Doggo friends!"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
