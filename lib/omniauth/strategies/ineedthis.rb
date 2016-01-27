require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class INeedThis < OmniAuth::Strategies::OAuth2

      option :client_options, {
          site: 'https://ineedthis.org',
          authorize_url: '/oauth/authorize',
          token_url: '/oauth/token'
      }

      uid { raw_info['id'].to_s }

      info do
        {
          name:     raw_info['name'],
          username: raw_info['username'],
          email:    raw_info['email'],
          image:    raw_info['avatar_url']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v3/user').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'ineedthis', 'INeedThis'
