class RelativesController < ApplicationController
  before_action :set_relative, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :authenticate_relaive_user, only: [:edit, :update, :destroy]

  # GET /relatives or /relatives.json
  def index
    @relatives = Relative.all
  end

  # GET /relatives/1 or /relatives/1.json
  def show
  end

  # GET /relatives/new
  def new
    # @relative = Relative.new
    @relative = current_user.relatives.build
  end

  # GET /relatives/1/edit
  def edit
  end

  def authenticate_relaive_user
    @relative = current_user.relatives.find_by(id: params[:id])
    redirect_to relatives_path, notice: "Not authorize to Edit or Delete" if @relative.nil?
  end


  # POST /relatives or /relatives.json
  def create
    # @relative = Relative.new(relative_params)
    @relative = current_user.relatives.build(relative_params)

    respond_to do |format|
      if @relative.save
        format.html { redirect_to relative_url(@relative), notice: "Relative was successfully created." }
        format.json { render :show, status: :created, location: @relative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatives/1 or /relatives/1.json
  def update
    respond_to do |format|
      if @relative.update(relative_params)
        format.html { redirect_to relative_url(@relative), notice: "Relative was successfully updated." }
        format.json { render :show, status: :ok, location: @relative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatives/1 or /relatives/1.json
  def destroy
    @relative.destroy

    respond_to do |format|
      format.html { redirect_to relatives_url, notice: "Relative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relative
      @relative = Relative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relative_params
      params.require(:relative).permit(:name, :relation, :user_id)
    end
end
