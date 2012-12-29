class ExperienceDetailsController < ApplicationController
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
    @experience_detail = ExperienceDetail.new(params[:experience_detail])

    respond_to do |format|
      if @experience_detail.save
        format.html { redirect_to @experience_detail, notice: 'Experience detail was successfully created.' }
        format.json { render json: @experience_detail, status: :created, location: @experience_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @experience_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experience_details/1
  # PUT /experience_details/1.json
  def update
    @experience_detail = ExperienceDetail.find(params[:id])

    respond_to do |format|
      if @experience_detail.update_attributes(params[:experience_detail])
        format.html { redirect_to @experience_detail, notice: 'Experience detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experience_detail.errors, status: :unprocessable_entity }
      end
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
