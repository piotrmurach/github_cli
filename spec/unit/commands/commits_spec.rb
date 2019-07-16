# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Commits do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:sha)    { "3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15" }
  let(:api_class) { GithubCLI::Commit }

  it "invokes commit:get" do
    expect(api_class).to receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "commit:get", [user, repo, sha]
  end

  it "invokes commit:create" do
    expect(api_class).to receive(:create).with(user, repo, {}, format)
    subject.invoke "commit:create", [user, repo]
  end

  it "invokes commit:create --tree" do
    opts = {
      "message" => "my commit message",
      "author" => {
          "name" => "Mona Octocat",
          "email" => "octocat@github.com",
          "date" => "2008-07-09T16:13:30+12:00"
      },
      "parents" => [
        "7d1b31e74ee336d15cbd21741bc88a537ed063a0"
      ],
      "tree" => "827efc6d56897b048c772eb4087f854f46256132",
      "signature" => "-----BEGIN PGP SIGNATURE-----\n\niQIzBAABAQAdFiEESn/54jMNIrGSE6Tp6cQjvhfv7nAFAlnT71cACgkQ6cQjvhfv\n7nCWwA//XVqBKWO0zF+bZl6pggvky3Oc2j1pNFuRWZ29LXpNuD5WUGXGG209B0hI\nDkmcGk19ZKUTnEUJV2Xd0R7AW01S/YSub7OYcgBkI7qUE13FVHN5ln1KvH2all2n\n2+JCV1HcJLEoTjqIFZSSu/sMdhkLQ9/NsmMAzpf/iIM0nQOyU4YRex9eD1bYj6nA\nOQPIDdAuaTQj1gFPHYLzM4zJnCqGdRlg0sOM/zC5apBNzIwlgREatOYQSCfCKV7k\nnrU34X8b9BzQaUx48Qa+Dmfn5KQ8dl27RNeWAqlkuWyv3pUauH9UeYW+KyuJeMkU\n+NyHgAsWFaCFl23kCHThbLStMZOYEnGagrd0hnm1TPS4GJkV4wfYMwnI4KuSlHKB\njHl3Js9vNzEUQipQJbgCgTiWvRJoK3ENwBTMVkKHaqT4x9U4Jk/XZB6Q8MA09ezJ\n3QgiTjTAGcum9E9QiJqMYdWQPWkaBIRRz5cET6HPB48YNXAAUsfmuYsGrnVLYbG+\nUpC6I97VybYHTy2O9XSGoaLeMI9CsFn38ycAxxbWagk5mhclNTP5mezIq6wKSwmr\nX11FW3n1J23fWZn5HJMBsRnUCgzqzX3871IqLYHqRJ/bpZ4h20RhTyPj5c/z7QXp\neSakNQMfbbMcljkha+ZMuVQX1K9aRlVqbmv3ZMWh+OijLYVU2bc=\n=5Io4\n-----END PGP SIGNATURE-----\n"
    }
    expect(api_class).to receive(:create).with(user, repo, opts, format)
    subject.invoke "commit:create", [user, repo], opts
  end
end
