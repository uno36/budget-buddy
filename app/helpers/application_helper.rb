module ApplicationHelper
  def available_category_icons
    icon_directory = Rails.root.join('app', 'assets', 'images', 'category_icons')
    Dir.entries(icon_directory).select { |file| file.ends_with?('.png') }
  end
end
