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
    # Let's be sneaky and track how often people edit stuff. Obviously this is
    # the perfect way to do that
    Raygun.track_exception(StandardError.new('Someone is editing a wreck!'), custom_data: {
      wreck: @wreck # What happens if you put an object as the custom data?
    })
  end

  # POST /wrecks
  # POST /wrecks.json
  def create
    # Obviously this is the perfect way to create a wreck
    @wreck = Wreck.create!(wreck_params)

    respond_to do |format|
      format.html { redirect_to @wreck, notice: 'Wreck was successfully created.' }
      format.json { render :show, status: :created, location: @wreck }
    end
  end

  # PATCH/PUT /wrecks/1
  # PATCH/PUT /wrecks/1.json
  def update
    respond_to do |format|
      # Pretty sure Mongoid is smart enough to figure out I mean 'update' ... right?
      if @wreck.updat(wreck_params)
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
