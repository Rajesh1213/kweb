class JobPostsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => "save_job_post"
  # GET /job_posts
  # GET /job_posts.json
  def index
    @job_posts = JobPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_posts }
    end
  end

  # GET /job_posts/1
  # GET /job_posts/1.json
  def show
    @job_post = JobPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_post }
    end
  end

  # GET /job_posts/new
  # GET /job_posts/new.json
  def new
    @job_post = JobPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_post }
    end
  end

  # GET /job_posts/1/edit
  def edit
    @job_post = JobPost.find(params[:id])
  end

  # POST /job_posts
  # POST /job_posts.json
  def create
    @job_post = JobPost.new(params[:job_post])

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to @job_post, notice: 'Job post was successfully created.' }
        format.json { render json: @job_post, status: :created, location: @job_post }
      else
        format.html { render action: "new" }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_posts/1
  # PUT /job_posts/1.json
  def update
    @job_post = JobPost.find(params[:id])

    respond_to do |format|
      if @job_post.update_attributes(params[:job_post])
        format.html { redirect_to @job_post, notice: 'Job post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_posts/1
  # DELETE /job_posts/1.json
  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy

    respond_to do |format|
      format.html { redirect_to job_posts_url }
      format.json { head :no_content }
    end
  end

  def save_job_post
    logger.info">>> in save_job_post  #{params.inspect}"
    job_post = JobPost.new(params[:job_post])
    job_post.user_id = params[:id]
    if job_post.save
      flash[:notice] = "Job posted successfully"
      redirect_to("/job_posts/view_post/#{job_post.id}")
    else
      flash[:notice] = "Enter proper data"
      redirect_to(post_job_description_path)
    end
  end

  def view_post
    @job_post = JobPost.find(params[:id])
  end

  def edit_job_post
    @job_post = JobPost.find(params[:id])
  end

  def view_all_posts
    @job_posts = current_user.job_posts.order("id desc")
  end
    
end