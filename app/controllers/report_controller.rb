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
    @inutilizado = Patrimony.all.where(status: "Inutilizado")
  end

  def criacao_por_data

  end

end