# encoding: utf-8

require 'spec_helper'

describe GithubCLI::API, '#configure' do
  let(:object) { described_class }

  before {
    GithubCLI.stub(:config).and_return(config)
  }

  subject { object.configure }

  context 'with default' do
    let(:config) { { } }

    its(:adapter) { should eql(:net_http) }

    its(:ssl) { should eql({}) }

    its(:site) { should eql('https://github.com') }

    its(:endpoint) { should eql('https://api.github.com') }

    its(:oauth_token) { should be_nil }
  end

  context 'with config values' do
    let(:config) {
      {
       'core.ssl' => {"verify" => false},
       'core.adapter' => :patron,
       'core.site' => 'http://site.com',
       'core.endpoint' => 'http://api.com',
       'user.token' => 'abc1234'
      }
    }

    its(:adapter) { should eql(:patron) }

    its(:ssl) { should eql({"verify" => false})}

    its(:site) { should eql('http://site.com')}

    its(:endpoint) { should eql('http://api.com') }

    its(:oauth_token) { should eql('abc1234') }
  end

end
