require "uri"
require "net/http"



class SpacexConsult

  # Classe que comporta os métodos de requisição para a API da SpaceX

  # Método - Requisição GET - Próximo lançamento
  def read_next_launch
    url = URI("https://api.spacexdata.com/v4/launches/next")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
  end

  # Método - Requisição GET - Último lançamento
  def read_latest_launch
    url = URI("https://api.spacexdata.com/v4/launches/latest")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
  end

  # Método - Requisição GET - Próximos lançamentos
  def read_upcoming_launches
    url = URI("https://api.spacexdata.com/v4/launches/upcoming")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
  end

  # Método - Requisição GET - Lançamentos passados
  def read_past_launches
    url = URI("https://api.spacexdata.com/v4/launches/past")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response.read_body
  end


end



class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :update, :destroy]

  # Tratamento das requisições provenientes do FrontEnd

  # Trata próximo lançamento
  def next
    #puts "Consultando API da SpaceX - Próximo Lançamento - Next Launch"
    consulta = SpacexConsult.new
    render json: consulta.read_next_launch
    #puts "Final da requisição!"
  end

  # Trata último lançamento
  def latest
    #puts "Consultando API da SpaceX - Último Lançamento - Latest Launch"
    consulta = SpacexConsult.new
    render json: consulta.read_latest_launch
    #puts "Final da requisição!"
  end

  # Trata próximos lançamentos
  def upcoming
    #puts "Consultando API da SpaceX - Próximos Lançamento - Upcoming Launches"
    consulta = SpacexConsult.new
    render json: consulta.read_upcoming_launches
    #puts "Final da requisição!"
  end

  # Trata lançamentos passados
  def past
    #puts "Consultando API da SpaceX - Lançamentos Passados - Past Launches"
    consulta = SpacexConsult.new
    render json: consulta.read_past_launches
    #puts "Final da requisição!"
  end 

end
