# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Util, '#convert_value' do

  it { expect(subject.convert_value(false)).to eq "false" }

  it { expect(subject.convert_value(true)).to eq "true" }

  it { expect(subject.convert_value(:bar)).to eq "bar" }

  it { expect(subject.convert_value(123)).to eq "123" }

  it { expect(subject.convert_value({:a => false})).to eql ["false"] }

  it { expect(subject.convert_value([2.5])).to eql ["2.5"] }

end # convert_value
