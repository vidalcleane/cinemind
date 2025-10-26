class AiSearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    title = params[:title]
    
    if title.blank?
      render json: { error: 'Título é obrigatório' }, status: :unprocessable_entity
      return
    end

    service = AiMovieSearchService.new(title)
    result = service.call

    render json: result
  rescue StandardError => e
    Rails.logger.error("AI Search Error: #{e.message}")
    render json: { 
      error: 'Erro ao buscar informações do filme',
      message: e.message 
    }, status: :internal_server_error
  end
end
