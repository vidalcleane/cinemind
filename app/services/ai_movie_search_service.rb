class AiMovieSearchService
  def initialize(title)
    @title = title
  end

  def call
    return fallback_search if ENV['OPENAI_API_KEY'].blank?

    begin
      require 'uri'
      require 'net/http'
      require 'json'

      url = URI("https://api.openai.com/v1/chat/completions")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request["Authorization"] = "Bearer #{ENV['OPENAI_API_KEY']}"
      
      request.body = JSON.generate({
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content: "Você é um especialista em cinema. Retorne informações sobre filmes APENAS em formato JSON válido com as chaves: title, synopsis, year, duration (em minutos), director."
          },
          {
            role: "user",
            content: "Me dê informações sobre o filme: #{@title}"
          }
        ],
        temperature: 0.7,
        max_tokens: 500
      })

      response = http.request(request)
      data = JSON.parse(response.body)

      if data['error']
        Rails.logger.error("OpenAI Error: #{data['error']['message']}")
        return fallback_search
      end

      content = data.dig('choices', 0, 'message', 'content')
      parse_response(content)
    rescue StandardError => e
      Rails.logger.error("OpenAI API Error: #{e.message}")
      fallback_search
    end
  end

  private

  def parse_response(content)
    clean_content = content.gsub(/```json\n?/, '').gsub(/```\n?/, '').strip
    json_match = clean_content.match(/\{.*\}/m)
    
    if json_match
      JSON.parse(json_match[0])
    else
      {
        "title" => @title,
        "synopsis" => content,
        "year" => nil,
        "duration" => nil,
        "director" => nil
      }
    end
  rescue JSON::ParserError
    fallback_search
  end

  def fallback_search
    {
      "title" => @title,
      "synopsis" => "Configure a OPENAI_API_KEY para busca automática.",
      "year" => nil,
      "duration" => nil,
      "director" => nil
    }
  end
end
