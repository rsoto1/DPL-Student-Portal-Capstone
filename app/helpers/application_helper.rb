module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def page_header(page_header)
    content_for(:page_header) { page_header }
  end

  def get_has_many_assocations
    AppStats::Stats.get_has_many_relationships
  end

  def get_has_many_assocations_formatted(options = {})
    ul(AppStats::Stats.get_has_many_relationships, options)
  end

  def get_loc_sorted
    AppStats::Stats.get_loc_sorted
  end

  def get_loc_sorted_formatted(options = {})
    ul(AppStats::Stats.get_loc_sorted, options)
  end

  def get_loc_count
    AppStats::Stats.get_loc_count
  end

  def get_loc_count_formatted(options = {})
    ul(AppStats::Stats.get_loc_count, options)
  end

  # http://qerub.se/list-helper-for-rails
  def html_list(type, elements, options = {})
    if elements.empty?
      ''
    else
      lis = elements.map { |el| content_tag('li', el) }
      content_tag(type, lis.join.html_safe, options)
    end
  end

  def ul(*args)
    html_list('ul', *args)
  end

  def ol(*args)
    html_list('ol', *args)
  end
end
