# frozen_string_literal: true

RSpec.describe GithubCLI::Util do
  context '#flatten_has' do
    let(:hash) { { :a => { :b => { :c => 1 }}} }

    it 'preserves original hash' do
      hash = { :a => 1, :b => 2 }
      output = subject.flatten_hash hash
      expect(output).to eq(hash)
    end

    it "reduces multidimensional keys to one dimension" do
      output = subject.flatten_hash hash
      expect(output).to eq({ :a_b_c => 1 })
    end
  end

  context '#longest_common_prefix' do
    it 'finds common prefix' do
      a = 'tribe'; b = 'tree'
      expect(subject.longest_common_prefix(a,b)).to eq("tr")
    end

    it 'fails to find common prefix' do
      a = 'foo'; b = 'bar'
      expect(subject.longest_common_prefix(a,b)).to be_empty
    end
  end
end # GithubCLI::Util
