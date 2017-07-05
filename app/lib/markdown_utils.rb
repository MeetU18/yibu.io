module MarkdownUtils
  module_function

  def init_markdown_renderer
  end

  def render content
    Kramdown::Document.new(content).to_html
  end
end