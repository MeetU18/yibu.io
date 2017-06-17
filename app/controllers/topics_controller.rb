class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_topic_by_user, only: [:edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])
  end

  # GET /topics/new
  def new
    @topic = current_user.topics.new
  end

  # GET /topics/1/edit
  def edit
    @topic = set_topic_by_user
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = current_user.topics.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html {redirect_to @topic, notice: 'Topic was successfully created.'}
        format.json {render :show, status: :created, location: @topic}
      else
        format.html {render :new}
        format.json {render json: @topic.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html {redirect_to @topic, notice: 'Topic was successfully updated.'}
        format.json {render :show, status: :ok, location: @topic}
      else
        format.html {render :edit}
        format.json {render json: @topic.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html {redirect_to topics_url, notice: 'Topic was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  def set_topic_by_user
    @topic = current_user.topics.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title, :content, :user_id)
  end
end
