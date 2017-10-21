class ShortVideosController < ApplicationController
  before_action :set_short_video, only: [:show, :edit, :update, :destroy]

  # GET /short_videos
  # GET /short_videos.json
  def index
    @short_videos = ShortVideo.all
  end

  # GET /short_videos/1
  # GET /short_videos/1.json
  def show
  end

  # GET /short_videos/new
  def new
    @short_video = ShortVideo.new
  end

  # GET /short_videos/1/edit
  def edit
  end

  # POST /short_videos
  # POST /short_videos.json
  def create
    @short_video = ShortVideo.new(short_video_params)

    respond_to do |format|
      if @short_video.save
        format.html { redirect_to @short_video, notice: 'Short video was successfully created.' }
        format.json { render :show, status: :created, location: @short_video }
      else
        format.html { render :new }
        format.json { render json: @short_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_videos/1
  # PATCH/PUT /short_videos/1.json
  def update
    respond_to do |format|
      if @short_video.update(short_video_params)
        format.html { redirect_to @short_video, notice: 'Short video was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_video }
      else
        format.html { render :edit }
        format.json { render json: @short_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_videos/1
  # DELETE /short_videos/1.json
  def destroy
    @short_video.destroy
    respond_to do |format|
      format.html { redirect_to short_videos_url, notice: 'Short video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_video
      @short_video = ShortVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_video_params
      params.fetch(:short_video, {})
    end
end
