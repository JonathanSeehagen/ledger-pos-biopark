class ReportsController < ApplicationController
  def balance
    puts current_user
    # Envia o e-mail de boas-vindas
    UserMailer.welcome_email(current_user).deliver_now
    #   redirect_to @user, notice: 'User was successfully created.'
    # else
    #   render :new
    # end
  end
end
