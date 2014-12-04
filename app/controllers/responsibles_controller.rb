class ResponsiblesController < ApplicationController
  before_action :set_responsible, only: [:show, :edit, :update, :destroy]
  before_action :set_track, only: [:create, :update, :destroy]

  def set_track
    @track = Track.new({model: "Responsáveis", action: action_name.to_s, user_id: current_user.id})
    @track.save
  end

  # GET /responsibles
  # GET /responsibles.json
  def index
    @responsibles = Responsible.all
  end

  # GET /responsibles/1
  # GET /responsibles/1.json
  def show
  end

  # GET /responsibles/new
  def new
    @responsible = Responsible.new
  end

  # GET /responsibles/1/edit
  def edit
  end

  # POST /responsibles
  # POST /responsibles.json
  def create
    @responsible = Responsible.new(responsible_params)
    @responsible.identifier = Digest::MD5.hexdigest(@responsible.email.to_s)
    respond_to do |format|
      if @responsible.save
        format.html { redirect_to @responsible, notice: 'Responsável criado com sucesso.' }
        format.json { render :show, status: :created, location: @responsible }
      else
        format.html { render :new }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsibles/1
  # PATCH/PUT /responsibles/1.json
  def update
    respond_to do |format|
      if @responsible.update(responsible_params)
        format.html { redirect_to @responsible, notice: 'Responsável atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @responsible }
      else
        format.html { render :edit }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibles/1
  # DELETE /responsibles/1.json
  def destroy
    @responsible.destroy
    respond_to do |format|
      format.html { redirect_to responsibles_url, notice: 'Responsável deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsible
      @responsible = Responsible.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsible_params
      params.require(:responsible).permit(:identifier, :name, :email, :birth, :address, :tel)
    end
end
