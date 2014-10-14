module NavigationHelper
  def build_breadcrumb(nav)
    navigation = ''
    nav = nav.split('/')
    nav[0] = 'Dashboard'
    nav.delete_if { |el| el == '' || !(el =~ /\A\d+\z/).nil? }
    nav.each { |n| navigation << "#{n.capitalize} > " }
    navigation << (content_for?(:title) ? content_for(:title) : '')
    (navigation.last == ' ') ? navigation[0...-3] : navigation
  end
end
