class UserMailer < ApplicationMailer
  default from: 'noreply@posbiopark.com'

  def send_mail_pessoas_balanco(user, csv_data)

    # Salvar o CSV em um arquivo temporário
    temp_file = Tempfile.new(['people_balance', '.csv'])
    temp_file.write(csv_data)
    temp_file.rewind

    @user = user
    attachments['people_balance.csv'] = File.read(temp_file)
    mail(to: @user.email, subject: 'Planilha Pessoas X Balanço')

    # Fechar e excluir o arquivo temporário após o uso
    temp_file.close
    temp_file.unlink
  end
end
