class ExperienceDetailsController < ApplicationController
  before_filter :authenticate_user!
  # GET /experience_details
  # GET /experience_details.json
  def index
    @experience_details = ExperienceDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experience_details }
    end
  end

  # GET /experience_details/1
  # GET /experience_details/1.json
  def show
    @experience_detail = ExperienceDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experience_detail }
    end
  end

  # GET /experience_details/new
  # GET /experience_details/new.json
  def new
    @experience_detail = ExperienceDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experience_detail }
    end
  end

  # GET /experience_details/1/edit
  def edit
    @experience_detail = ExperienceDetail.find(params[:id])
  end

  # POST /experience_details
  # POST /experience_details.json
  def create
    logger.info"PARAMS in create >>  #{params.inspect}"
    @experience_detail = ExperienceDetail.new(params[:experience_detail])

    if @experience_detail.save
      flash[:notice] = "Experience details created successfully"
      if params[:commit] == "Done"
        redirect_to("/qualification_details/new/#{current_user.id}")
      else
        redirect_to("/experience_details/new/#{current_user.id}")
      end
    else
      render action: "new"
    end
  end

  # PUT /experience_details/1
  # PUT /experience_details/1.json
  def update
    logger.info"PARAMS #{params.inspect}"
    @experience_detail = ExperienceDetail.find(params[:id])
    
    if @experience_detail.update_attributes(params[:experience_detail])
      flash[:notice] = "Experience details updated successfully"
      redirect_to("/resumes/profile/#{current_user.id}")
    else
      flash[:notice] = "Give proper data"
      redirect_to("/experience_details/edit/#{params[:id]}")
    end
  end

  # DELETE /experience_details/1
  # DELETE /experience_details/1.json
  def destroy
    @experience_detail = ExperienceDetail.find(params[:id])
    @experience_detail.destroy

    respond_to do |format|
      format.html { redirect_to experience_details_url }
      format.json { head :no_content }
    end
  end
end
