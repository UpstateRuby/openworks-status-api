module RequestHelper
  def authorized_headers
    {
      'HTTP_ACCEPT' => 'application/vnd.api+json',
      'HTTP_AUTHORIZATION' => 'Token openworksauthtoken'
    }
  end

  def authorized_preflight_headers
    {
      'HTTP_ACCESS_CONTROL_REQUEST_HEADER' => 'accept, authorization, origin',
      'HTTP_ACCESS_CONTROL_REQUEST_METHOD' => 'GET',
      'ORIGIN' => 'http://otherdomain.test/'
    }
  end
end

module ActionDispatch::Integration::RequestHelpers
  def options(path, parameters = nil, headers_or_env = nil)
    process :options, path, parameters, headers_or_env
  end
end
