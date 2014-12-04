class PatrimoniesController < ApplicationController
  before_action :set_patrimony, only: [:show, :edit, :update, :destroy]
  before_action :set_track, only: [:create, :update, :destroy]

  def set_track
    @track = Track.new({model: "Patrimônios", action: action_name.to_s, user_id: current_user.id})
    @track.save
  end

  # GET /patrimonies
  # GET /patrimonies.json
  def index
    @patrimonies = Patrimony.all
  end

  # GET /patrimonies/1
  # GET /patrimonies/1.json
  def show
  end

  # GET /patrimonies/new
  def new
    @patrimony = Patrimony.new
  end

  # GET /patrimonies/1/edit
  def edit
  end

  # POST /patrimonies
  # POST /patrimonies.json
  def create
    @patrimony = Patrimony.new(patrimony_params)

    @patrimony.identifier = Digest::MD5.hexdigest(Time.now.strftime("%Y-%d-%m %H:%M:%S %Z").to_s)


    respond_to do |format|
      if @patrimony.save
        format.html { redirect_to @patrimony, notice: 'Patrimony was successfully created.' }
        format.json { render :show, status: :created, location: @patrimony }
      else
        format.html { render :new }
        format.json { render json: @patrimony.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /patrimonies/1
  # PATCH/PUT /patrimonies/1.json
  def update
    respond_to do |format|

      if @patrimony.update(patrimony_params)
        format.html { redirect_to @patrimony, notice: 'Patrimony was successfully updated.' }
        format.json { render :show, status: :ok, location: @patrimony }
      else
        format.html { render :edit }
        format.json { render json: @patrimony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patrimonies/1
  # DELETE /patrimonies/1.json
  def destroy
    @patrimony.destroy
    respond_to do |format|
      format.html { redirect_to patrimonies_url, notice: 'Patrimony was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patrimony
      @patrimony = Patrimony.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patrimony_params
      params.require(:patrimony).permit(:name, :identifier, :status, :description, :responsible_id, :room_id)
    end
end
