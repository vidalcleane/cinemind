class ImportMailer < ApplicationMailer
  def import_completed(movie_import)
    @movie_import = movie_import
    @user = movie_import.user
    
    mail(
      to: @user.email,
      subject: '✅ Importação de filmes concluída!'
    )
  end

  def import_failed(movie_import)
    @movie_import = movie_import
    @user = movie_import.user
    
    mail(
      to: @user.email,
      subject: '❌ Erro na importação de filmes'
    )
  end
end
