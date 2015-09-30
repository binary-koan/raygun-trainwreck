class WrecksController < ApplicationController
  before_action :set_wreck, only: [:show, :edit, :update, :destroy]

  # GET /wrecks
  # GET /wrecks.json
  def index
    @wrecks = Wreck.all
  end

  # GET /wrecks/1
  # GET /wrecks/1.json
  def show
  end

  # GET /wrecks/new
  def new
    @wreck = Wreck.new
  end

  # GET /wrecks/1/edit
  def edit
  end

  # POST /wrecks
  # POST /wrecks.json
  def create
    @wreck = Wreck.new(wreck_params)

    respond_to do |format|
      if @wreck.save
        format.html { redirect_to @wreck, notice: 'Wreck was successfully created.' }
        format.json { render :show, status: :created, location: @wreck }
      else
        format.html { render :new }
        format.json { render json: @wreck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wrecks/1
  # PATCH/PUT /wrecks/1.json
  def update
    respond_to do |format|
      if @wreck.update(wreck_params)
        format.html { redirect_to @wreck, notice: 'Wreck was successfully updated.' }
        format.json { render :show, status: :ok, location: @wreck }
      else
        format.html { render :edit }
        format.json { render json: @wreck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wrecks/1
  # DELETE /wrecks/1.json
  def destroy
    @wreck.destroy
    respond_to do |format|
      format.html { redirect_to wrecks_url, notice: 'Wreck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wreck
      @wreck = Wreck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wreck_params
      params.require(:wreck).permit(:message, :is_epic, :is_boring, :is_spectacular)
    end
end
