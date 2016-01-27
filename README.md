# Omniauth::Ineedthis

[![Join the chat at https://gitter.im/mjcloutier/omniauth-ineedthis](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/mjcloutier/omniauth-ineedthis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is the OAuth2 strategy for authenticating to your INeedThis service.

## Requirements

INeedThis

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-ineedthis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-ineedthis

## Basic Usage

    use OmniAuth::Builder do
      provider :ineedthis, ENV['INEEDTHIS_KEY'], ENV['INEEDTHIS_SECRET']
    end

## Standalone Usage

    use OmniAuth::Builder do
      provider :ineedthis, ENV['INEEDTHIS_KEY'], ENV['INEEDTHIS_SECRET'], client_options: {
        site: 'https://ineedthis.org',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/token'
      }      
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
