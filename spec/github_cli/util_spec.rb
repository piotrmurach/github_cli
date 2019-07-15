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
end # GithubCLI::Util
