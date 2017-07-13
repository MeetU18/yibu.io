module TopicsHelper
  # TODO topic.tag raise cast error, maybe a rails bug, check it later
  def render_topic_info topic, comments: false
    <<-HTML.html_safe
      <span>#{topic.user.username} 发布于 </span>#{link_to Tag.find(topic.tag_id).name, tag_topics_path(topic.tag_id) }
      <span> #{ time_ago_in_words topic.created_at }前 </span>
      #{link_to("查看评论(#{topic.comments_count})", topic) if comments}
    HTML
  end
end
