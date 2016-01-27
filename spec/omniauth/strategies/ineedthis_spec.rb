require 'spec_helper'

describe OmniAuth::Strategies::INeedThis do

  let(:access_token) { double('AccessToken') }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', parsed: parsed_response) }

  let(:enterprise_site)           { 'https://some.other.site.com/api/v3' }
  let(:enterprise_authorize_url)  { '/oauth/authorize' }
  let(:enterprise_token_url)      { '/oauth/access_token' }

  let(:ineedthis_service) { OmniAuth::Strategies::INeedThis.new({}) }

  let(:enterprise) do
    OmniAuth::Strategies::INeedThis.new(
      'INEEDTHIS_KEY',
      'INEEDTHIS_SECRET',
      client_options: {
        site: enterprise_site,
        authorize_url: enterprise_authorize_url,
        token_url: enterprise_token_url
      }
    )
  end

  subject { ineedthis_service }

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  describe 'client options' do
    context 'with defaults' do
      subject { ineedthis_service.options.client_options }

      its(:site) { is_expected.to eq 'https://ineedthis.org' }
      its(:authorize_url) { is_expected.to eq '/oauth/authorize' }
      its(:token_url) { is_expected.to eq '/oauth/token' }
    end

    context 'with override' do
      subject { enterprise.options.client_options }

      its(:site) { is_expected.to eq enterprise_site }
      its(:authorize_url) { is_expected.to eq enterprise_authorize_url }
      its(:token_url) { is_expected.to eq enterprise_token_url }
    end
  end

  describe '#raw_info' do
    it 'sent request to current user endpoint' do
      expect(access_token).to receive(:get).with('/api/v3/user').and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end
  end
end
