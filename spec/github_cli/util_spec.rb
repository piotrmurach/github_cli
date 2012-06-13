require 'spec_helper'

describe GithubCLI::Util do
  describe '#flatten_has' do
    let(:hash) { { :a => { :b => { :c => 1 }}} }

    it 'preserves original hash' do
      hash = { :a => 1, :b => 2 }
      output = subject.flatten_hash hash
      output.should == hash
    end

    it "reduces multidimensional keys to one dimension" do
      output = subject.flatten_hash hash
      output.should == { :a_b_c => 1 }
    end
  end

  describe '#convert_values' do
    let(:values) { [true, {:a => false }, 'string']}

    it "converts ruby boolean to string" do
      subject.convert_values(values).should include "true"
      subject.convert_values(values).should_not include true
    end

    it "converts recursively" do
      subject.convert_values(values).should include ['false']
    end

    it 'preserves strings' do
      subject.convert_values(values).should include 'string'
    end
  end

  describe "#convert_value" do
    it 'converts arrays to arrays of strings' do
      values = [:bar, 123, 3.14]
      subject.convert_value(values).should eq(["bar", "123", "3.14"])
    end

    it 'converts hash values to strings' do
      values = {:foo => 123, :bar => :baz, :buz => 2.3}
      subject.convert_value(values).should eq(["123", "baz", "2.3"])
    end
  end
end # GithubCLI::Util
