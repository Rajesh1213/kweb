class QualificationDetailsController < ApplicationController
  # GET /qualification_details
  # GET /qualification_details.json
  def index
    @qualification_details = QualificationDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qualification_details }
    end
  end

  # GET /qualification_details/1
  # GET /qualification_details/1.json
  def show
    @qualification_detail = QualificationDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qualification_detail }
    end
  end

  # GET /qualification_details/new
  # GET /qualification_details/new.json
  def new
    @qualification_detail = QualificationDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @qualification_detail }
    end
  end

  # GET /qualification_details/1/edit
  def edit
    @qualification_detail = QualificationDetail.find(params[:id])
  end

  # POST /qualification_details
  # POST /qualification_details.json
  def create
    @qualification_detail = QualificationDetail.new(params[:qualification_detail])

    respond_to do |format|
      if @qualification_detail.save
        format.html { redirect_to @qualification_detail, notice: 'Qualification detail was successfully created.' }
        format.json { render json: @qualification_detail, status: :created, location: @qualification_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @qualification_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /qualification_details/1
  # PUT /qualification_details/1.json
  def update
    @qualification_detail = QualificationDetail.find(params[:id])

    respond_to do |format|
      if @qualification_detail.update_attributes(params[:qualification_detail])
        format.html { redirect_to @qualification_detail, notice: 'Qualification detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qualification_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualification_details/1
  # DELETE /qualification_details/1.json
  def destroy
    @qualification_detail = QualificationDetail.find(params[:id])
    @qualification_detail.destroy

    respond_to do |format|
      format.html { redirect_to qualification_details_url }
      format.json { head :no_content }
    end
  end
end
