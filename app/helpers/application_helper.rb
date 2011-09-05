module ApplicationHelper
  def jquery_cdn
    cdn_tag = javascript_include_tag('//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js')
    script_include = javascript_include_tag('jquery').gsub(/(.*)(<)(.*)/, '\1\\x3C\3')    
    local_tag = "<script>window.jQuery || document.write('" + script_include + "')</script>"
    "#{cdn_tag}\n#{local_tag}".html_safe
  end
end
