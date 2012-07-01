# GithubCLI<img src="https://github.com/peter-murach/github_cli/raw/master/ghc_logo.png" align="right" />
[![Build Status](https://secure.travis-ci.org/peter-murach/github_cli.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/peter-murach/github_cli.png?travis)][gemnasium] [![Code Climate](https://codeclimate.com/badge.png)][codeclimate]

[travis]: http://travis-ci.org/peter-murach/github_cli
[gemnasium]: https://gemnasium.com/peter-murach/github_cli
[codeclimate]: https://codeclimate.com/github/peter-murach/github_cli

CLI-based access to GitHub API v3 that works hand-in-hand with 'github_api' gem.

## Installation

Add this line to your application's Gemfile:

    gem 'github_cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github_cli

## Usage

Run it:

```shell
$ ghc
```

### Initialize a configuration file

The first step is to create a configuration file:

```shell
$ ghc init
```

This will setup a `.githubrc` configuration file in your home directory with
all the global settings. During the install process you will be prompted for your
`authentication token`.

### Getting a list of commands

You can list all GitHub APIs comamnds:

```shell
$ ghc list
```

to limit returned results pass `pattern`

```shell
$ ghc list re*   # Returns all commands matching the pattern
```

### API

Interact with git data:

```shell
$ ghc blob
$ ghc commit
$ ghc ref
$ ghc tag
$ ghc tree
```

Interact with issues:

```shell
$ ghc issue
$ ghc label
$ ghc milestone
$ ghc comment
```

Interact with repositories:

```shell
$ ghc repo
$ ghc collab
$ ghc content
$ ghc download
$ ghc fork
$ ghc hook
$ ghc key
$ ghc watching
```

Interact with gists:

```shell
$ ghc gist
```

Interact with users:

```shell
$ ghc user
$ ghc email
$ ghc follower
```

Interact with organizations:

```shell
$ ghc org
$ ghc member
$ ghc team
```

Interact with authorizations:

```shell
$ ghc auth
```

Interact with search:

```shell
$ ghc search
```

### Output Format

The API responses can be formatted as `csv`, `json`, `pretty`, `table`.

By default responses are in tabular format. Tables are available in `horizontal` and `vertical` mode. To enforce table display pass `:h` and `:v` respectively. Otherwise a default orientation will be picked depending on the request made and terminal size.

```shell
ghc user get -u peter-murach --format=table:h

┏━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳
┃ type     ┃ login    ┃ public_… ┃ blog     ┃ hireable ┃ followe… ┃ followi… ┃ location ┃ html_url ┃ name     ┃
┣━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋
┃ User     ┃ peter-m… ┃ 14       ┃ peter-m… ┃ false    ┃ 18       ┃ 52       ┃ Sheffie… ┃ https:/… ┃ Piotr M… ┃
┗━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻
```

To get `csv` formatting for easy command piping do

```shell
ghc repo ls -u wycats --format=csv
```

### Output Paging

By default all responses are paged. You can switch off paging by supplying `no-pager` flag.

```shell
ghc --no-pager user ls -u wycats
```

Also you can supply you preferred `pager`, otherwise the paging program is taken from environment variable PAGER if defined or defaults to "less".

### Examples

You can create repository by supplying required parameters

```shell
ghc repo create --params=name:'octocat' description:'Test repo for kitty.'
```

To find out which options are required type

```shell
ghc repo help create
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Piotr Murach. See LICENSE for further details.
