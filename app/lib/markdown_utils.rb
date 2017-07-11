module MarkdownUtils
  class Renderer
    include ActionView::Helpers::SanitizeHelper
  end
  
  module_function

  def render content
    renderer = Renderer.new
    Kramdown::Document.new(renderer.strip_tags content).to_html
  end
end