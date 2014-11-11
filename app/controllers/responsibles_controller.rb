class ResponsiblesController < ApplicationController
  before_action :set_responsible, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @responsible.save
        format.html { redirect_to @responsible, notice: 'Responsible was successfully created.' }
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
        format.html { redirect_to @responsible, notice: 'Responsible was successfully updated.' }
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
      format.html { redirect_to responsibles_url, notice: 'Responsible was successfully destroyed.' }
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
      params.require(:responsible).permit(:name, :email)
    end
end
