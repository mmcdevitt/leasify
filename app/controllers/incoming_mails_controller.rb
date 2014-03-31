class IncomingMailsController < ApplicationController

	require 'mail'
  skip_before_action :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    Rails.logger.log Logger::INFO, message.subject #print the subject to the logs
    Rails.logger.log Logger::INFO, message.body.decoded #print the decoded body to the logs

    # Do some other stuff with the mail message

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end

end
