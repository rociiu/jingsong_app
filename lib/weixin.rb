require 'httparty'

class Weixin

  BASE_URL = "https://api.weixin.qq.com/cgi-bin"

  # appid: wxce7fc4bb99f63b4f
  # secret: ba77fdaf35bcf6a38c54fd276f4cdda3
  # access_token: zKKIq0L3R5TmH77RfVbWgWNgWohC2Bg4CSxDGNa-hu1Z2f0EELTF1JHSdzU9p0m6Hek89ppxJjQg_QJoGa3mirlJpAFP2fNhdm5EV1r0LI0
  #
  def initialize(attrs={})
    @appid        = attrs[:appid]
    @secret       = attrs[:secret]
    @access_token = attrs[:access_token]
  end

  def get_access_token
    params = {
      grant_type: 'client_credential',
      appid: @appid,
      secret: @secret
    }
    HTTParty.get(BASE_URL + '/token', {query: params})
  end

  def get_menu
    HTTParty.get(BASE_URL + '/menu/get', {query: access_token_params})
  end

  def create_menu(menu_hash)
    HTTParty.post(BASE_URL + "/menu/create?#{access_token_params.to_param}", {body: menu_hash.to_json})
  end

  def access_token_params
    { access_token: @access_token }
  end
end
