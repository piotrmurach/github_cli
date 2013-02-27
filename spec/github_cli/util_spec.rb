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
      expect(subject.convert_values([true])).to eql ["true"]
    end

    it "converts recursively" do
      subject.convert_values(values).should include ['false']
    end

    it 'preserves strings' do
      subject.convert_values(values).should include 'string'
    end
  end

  describe '#longest_common_prefix' do
    it 'finds common prefix' do
      a = 'tribe'; b = 'tree'
      subject.longest_common_prefix(a,b).should == "tr"
    end

    it 'fails to find common prefix' do
      a = 'foo'; b = 'bar'
      subject.longest_common_prefix(a,b).should be_empty
    end
  end
end # GithubCLI::Util
