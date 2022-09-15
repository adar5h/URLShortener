class ApplicationController < ActionController::Base

  def authentication
   unless params[:auth_token] == SECURITY_KEY
    render json: "Wrong authentication"
   end
  end

end
