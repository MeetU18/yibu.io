module MarkdownUtils
  module_function

  # NOTICE: maybe still include some dangerous tag like <script>, must sanitize before render
  def render content
    Kramdown::Document.new(content, input: :kramdown).to_html
  end
end