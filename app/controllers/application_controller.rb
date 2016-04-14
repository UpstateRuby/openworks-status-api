class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate!
  after_action :cors_set_access_control_headers

  private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin']      = '*'
    headers['Access-Control-Allow-Methods']     = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age']           = '1728000'
    headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def authenticate!
    render_unauthorized unless self.request.headers["Authorization"].present? and
                               self.request.headers["Authorization"].split(" ")[1] == "openworksauthtoken"
  end

  def render_unauthorized
    render_failure("http://status.openworks.com/403", "Unauthorized Request", "Your request is unauthorized because you are a hacker!")
  end

  def render_failure(errorUrl, title, details, status=:unauthorized)
      render json: { errors: [{
          links: { about: errorUrl },
          title: title,
          details: details,
          status: status }]
      }, status: status
  end
end
