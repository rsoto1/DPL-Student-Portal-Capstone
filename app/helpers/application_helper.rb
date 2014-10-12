module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def page_header(page_header)
    content_for(:page_header) { page_header }
  end

  def get_has_many_assocations(format = false, options={})
    if format
      ul(AppStats::Stats.get_has_many_relationships, options)
    else
      AppStats::Stats.get_has_many_relationships
    end
  end

  def get_loc_sorted(format = false, options={})
    if format
      ul(AppStats::Stats.get_loc_sorted, options)
    else
      AppStats::Stats.get_loc_sorted
    end
  end

  def get_loc_count(format = false, options={})
    if format
      ul(AppStats::Stats.get_loc_count, options)
    else
      AppStats::Stats.get_loc_count
    end
  end

  # http://qerub.se/list-helper-for-rails
  def html_list(type, elements, options = {})
    if elements.empty?
      "" 
    else
      lis = elements.map{ |x| content_tag("li", x) }
      content_tag(type, lis.join.html_safe, options)
    end
  end

  def ul(*args)
    html_list("ul", *args)
  end

  def ol(*args)
    html_list("ol", *args)
  end
end
