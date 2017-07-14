module TopicsHelper
  def render_topic_info topic, comments: false
    <<-HTML.html_safe
      <span>#{topic.user.username} 发布于 </span>#{link_to topic.tag.name, tag_topics_path(topic.tag.id) }
      <span> #{ time_ago_in_words topic.created_at }前 </span>
      #{link_to("查看评论(#{topic.comments_count})", topic) if comments}
    HTML
  end
end
