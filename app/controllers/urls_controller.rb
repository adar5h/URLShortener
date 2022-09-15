class UrlsController < ApplicationController

  before_action :authentication

  skip_before_action :verify_authenticity_token

  #Displays all the URLs in db
  def index
    @urls = Url.all
    render json: @urls, status: :ok
  end

  #
  def create
    @url = Url.new(url_params) #Creating a new record
    @url.short_url = SecureRandom.hex(3) #Creating a random hexadecimal code
      if @url.save!
        render json: {url: @url}, status: :ok
      else
        render json: "Error"
      end
  end

  # To view a particular record
  def show
    @url = Url.find_by(short_url: params[:short_url])
    render json: @url
  end

  def redirect
      @url = Url.find_by(short_url: params[:url_id])
      if @url.present?
        @url.click_count += 1
        @url.save!
        redirect_to @url.long_url, allow_other_host: true
      else
        render json: "Url not valid"
      end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end


end

#params

