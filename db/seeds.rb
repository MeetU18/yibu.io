# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Init tags
Tag.create(name: 'ShowCase',
           sequence: 1,
           introduce: <<-MD.strip_heredoc
              展示独立项目，分享你的创造故事！你的分享会给更多开发者带来鼓励和帮助
MD
)

Tag.create(name: '技术分享',
           sequence: 2,
           introduce: <<-MD.strip_heredoc
              编程语言，框架，开源技术都可以在这里分享讨论

              > 授之以鱼不如授之以渔
MD
)

Tag.create(name: '工作生活',
           sequence: 3,
           introduce: <<-MD.strip_heredoc
              工作与生活中遇到的好事与牢骚..
MD
)

Tag.create(name: 'Remote招聘',
           sequence: 4,
           introduce: <<-MD.strip_heredoc
              发布，求职 Remote工作

              请使用如下格式，格式不符合或不是远程工作将被删帖

              > [招聘] 标题
              >
              > [应聘] 标题
MD
)