class TagsController < ApplicationController

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
