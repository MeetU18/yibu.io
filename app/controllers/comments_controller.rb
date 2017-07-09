class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    topic = Topic.find(params[:topic_id])
    comment = if topic.root_comment
                topic.root_comment.children.build comment_params
              else
                topic.build_root_comment comment_params
              end
    comment.user = current_user
    if comment.save
      redirect_to topic, notice: '评论成功'
    else
      redirect_to topic, alert: comment.errors.messages[:content][0]
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
