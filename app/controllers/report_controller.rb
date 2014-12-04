class ReportController < ApplicationController
  require 'gchart'

  def room
    @rel1 = Patrimony.all.where(status: "Disponível").group(:room_id)
    @rel2 = Patrimony.all.where(status: "Ocupado").group(:room_id)
    @rel3 = Patrimony.all.where(status: "Manutenção").group(:room_id)
    @rel4 = Patrimony.all.where(status: "Inutilizado").group(:room_id)
  end

  def responsible
    @rel = Patrimony.all.group(:responsible_id)
    @rel1 = Patrimony.all.where(status: "Disponível").group(:responsible_id)
    @rel2 = Patrimony.all.where(status: "Ocupado").group(:responsible_id)
    @rel3 = Patrimony.all.where(status: "Manutenção").group(:responsible_id)
    @rel4 = Patrimony.all.where(status: "Inutilizado").group(:responsible_id)
  end

  def pizza1
    @patrimonio_lab = Patrimony.where(:room_id => Room.all.select("id").where(lab: true))
    @patrimonio_room = Patrimony.where(:room_id => Room.all.select("id").where(lab: false))
  end

  def bar1
    #um gráfico de barras com todos os responsáveis
    #e os valores das barras seriam a quantidade de patrimônios que cada um tem sob sua responsabilidade
    @responsible = Responsible.all
    #na view NAME and NUMBER-> item.name && item.patrimonies.size
  end

  def bar2
    #e um gráfico de barras com todos os status, mostrando quantos patrimônios estão em cada status
    @disponivel = Patrimony.all.where(status: "Disponível")
    @ocupado = Patrimony.all.where(status: "Ocupado")
    @manutencao = Patrimony.all.where(status: "Manutenção")
    @inutilizado = Patrimony.all.where(status: "Inutilizável")
  end

  def tc1

  end

  def tc2

  end

  def track_by_create
    user = User.find(params["/report/track_by_create"][:user_id])
    #data1 = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
    #data2 = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
    #@track = Track.where("user_id = #{user.id} AND created_at BETWEEN #{data1} AND #{data2}")

    #@track = Track.where(user_id: user.id)
    @track = Track.where("user_id = #{user.id}")
    @div = "#track-by-create"
    @caminho = "track_by_create"
    respond_to do |format|
      format.html { render "_track_by_create" }
      format.json { render json: @track }
      format.js { render :container }
    end
  end

  def criacao_por_data

  end

  def metodo

  end







end