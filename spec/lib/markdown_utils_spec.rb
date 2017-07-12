require 'rails_helper'

RSpec.describe MarkdownUtils do
  let(:content) {
    <<-HTML.strip_heredoc
      <script>evil codes...</script>
      <a href="javascript://alert('got you!');">click me</a>
      this is unkind input
      
      > To be nice people - Steve Jobs(fake)


      Markdown Tips
      ------

      [链接文字](http://example.net/)
      这里是**重点**
      ![图片标签](/path/to/img.jpg)
      

      ~~~
      # 代码块
      echo hello world
      ~~~
      

      一级标题
      =============
      
      二级标题
      -------------
      
      > 引用语法
    HTML
  }

  let(:markdown) {
    MarkdownUtils.render content
  }

  it "keep html tags" do
    expect(markdown).to include('<script>')
    expect(markdown).to include('<a')
  end

  it "blockquote should work" do
    expect(markdown).to include('<blockquote>')
  end

  it "code should work" do
    expect(markdown).to include('<code>')
    expect(markdown).to include('<pre>')
  end

  it "'#' in code should not parse as h1" do
    expect(markdown).to_not include(MarkdownUtils.render '# 代码块')
  end
end
