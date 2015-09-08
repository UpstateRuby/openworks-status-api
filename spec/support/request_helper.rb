module RequestHelper
  def authorized_headers
    {
      'HTTP_ACCEPT' => 'application/vnd.api+json',
      'HTTP_AUTHORIZATION' => 'Token openworksauthtoken'
    }
  end

  def authorized_preflight_headers
    {
      'HTTP_ACCEPT' => 'application/vnd.api+json',
      'HTTP_AUTHORIZATION' => 'Token openworksauthtoken',
      'HTTP_ACCESS_CONTROL_REQUEST_HEADERS' => 'accept, authorization',
      'HTTP_ACCESS_CONTROL_REQUEST_METHOD' => 'GET'
    }
  end
end

module ActionDispatch::Integration::RequestHelpers
  def options(path, parameters = nil, headers_or_env = nil)
    process :options, path, parameters, headers_or_env
  end
end
