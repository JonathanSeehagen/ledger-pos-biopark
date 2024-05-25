require 'csv'
  
class ReportsController < ApplicationController
  def balance    
    begin
      csv_data = CSV.generate(headers: true) do |csv|
        csv << ["Name", "Balance"] # Cabeçalho CSV
        Person.all.each do |person|
          csv << [person.name, person.balance]
        end
      end

      # Enviar o e-mail com o CSV anexado
      UserMailer.send_mail_pessoas_balanco(current_user, csv_data).deliver_later

      redirect_to root_path, notice: 'E-mail enviado com sucesso'
    rescue => e
      redirect_to root_path, notice: "Ocorreu um erro ao enviar o e-mail: #{e.message}"
    end
  end
end
