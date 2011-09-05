# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def meta_description(description)
    unless description.blank?
      content_for(:head) do
        tag :meta, { :name => 'keywords', :content => description }
      end
    end
  end

  def meta_keywords(*keywords)
    unless keywords.empty?
      content_for(:head) do
        tag :meta, { :name => 'keywords', :content => keywords.join(', ') }
      end
    end
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end

  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:scripts) { javascript_include_tag(*args) }
  end
end

