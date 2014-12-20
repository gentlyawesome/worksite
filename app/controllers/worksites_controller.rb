class WorksitesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :edit, :destroy]
  # GET /worksites
  # GET /worksites.json
  def index
    @worksites = Worksite.all
    @worksite = Worksite.new
    @hash = Gmaps4rails.build_markers(@worksites) do |worksite, marker|
      marker.lat worksite.latitude
      marker.lng worksite.longitude
      marker.infowindow worksite.description
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @worksites }
    end
  end

  # GET /worksites/1
  # GET /worksites/1.json
  def show
    @worksite = Worksite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @worksite }
    end
  end

  # GET /worksites/new
  # GET /worksites/new.json
  def new
    @worksite = Worksite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @worksite }
    end
  end

  # GET /worksites/1/edit
  def edit
    @worksites = Worksite.all
    @worksite = Worksite.find(params[:id])
    @hash = Gmaps4rails.build_markers(@worksites) do |worksite, marker|
      marker.lat worksite.latitude
      marker.lng worksite.longitude
      marker.infowindow worksite.description
    end
  end

  # POST /worksites
  # POST /worksites.json
  def create
    @worksite = Worksite.new(params[:worksite])

    respond_to do |format|
      if @worksite.save
        format.html { redirect_to worksites_url, notice: 'Worksite was successfully created.' }
        format.json { render json: @worksite, status: :created, location: @worksite }
      else
        format.html { render action: "new" }
        format.json { render json: @worksite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /worksites/1
  # PUT /worksites/1.json
  def update
    @worksite = Worksite.find(params[:id])

    respond_to do |format|
      if @worksite.update_attributes(params[:worksite])
        format.html { redirect_to worksites_url, notice: 'Worksite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worksite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksites/1
  # DELETE /worksites/1.json
  def destroy
    @worksite = Worksite.find(params[:id])
    @worksite.destroy

    respond_to do |format|
      format.html { redirect_to worksites_url }
      format.json { head :no_content }
    end
  end
end
