class CongressEmailsController < ApplicationController

  def create
    @congress_email = CongressEmail.new(params[:congress_email])
    if @congress_email.save
      redirect_to post_url(params[:post_id])
    else
      Rails.logger.warn("There was an error saving an email to congress!")
      Rails.logger.info(@congress_email.inspect)
      redirect_to :back
    end
  end
  
end
