class UrlsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @urls = Url.all
  end

  def create
    url = Url.new(url_params)
    url.short_url =SecureRandom.hex(3)

    if url.save!
      render json: {url: url}, status: :ok
    else
      render json: "Error"
    end
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])

    render json: @url.sanitize
  end

  def redirect
    puts ".."
    puts params[:url_id]
    url = Url.find_by(short_url: params[:url_id])
    url.click_count += 1
    url.save!
    redirect_to url.long_url, allow_other_host: true
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end


end
