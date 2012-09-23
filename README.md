# GithubCLI
[![Build Status](https://secure.travis-ci.org/peter-murach/github_cli.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/peter-murach/github_cli.png?travis)][gemnasium] [![Code Climate](https://codeclimate.com/badge.png)][codeclimate]

[travis]: http://travis-ci.org/peter-murach/github_cli
[gemnasium]: https://gemnasium.com/peter-murach/github_cli
[codeclimate]: https://codeclimate.com/github/peter-murach/github_cli

CLI-based access to GitHub API v3 that works hand-in-hand with `github_api` gem.

![Interface](https://github.com/peter-murach/github_cli/raw/master/screenshots/interface.png)

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
$ gcli
```

### Initialize a configuration file

The first step is to create a configuration file, either global in home directory or local inside the project:

```shell
$ gcli init [--global|--local]
```

This will setup a `.githubrc` configuration file in your home/project directory
with all the global settings. During the install process you will be prompted
for your `authentication token`.

Moreover, `gcli config` command allows you to set/get any configuration option such as output format, editor or oauth token.

For instance, to check value for your `token` do

```shell
$ gcli config [--global|--local] auth.token
```

and to set the value do

```shell
$ gcli config [--global|--local] auth.token lh23l4kj234....
```

To list specific options

```shell
$ gcli config [--global|--local] --list [regex]
```

### Arguments

The required arguments come first as per command description, then are followed by the optional arguments supplied inside a `params` flag.

For instance, one can create repository by supplying parameters in the following way:

```shell
$ gcli repo create octokit --params=description:'Test repo for kitty.'
```

To create repository inside organization:

```shell
$ gcli repo create github/octokit --params=description:'Test repo for kitty.'
```

To find out which options are required and which are optional - type:

```shell
$ gcli repo help create
```

### Getting a list of commands

You can list all GitHub APIs comamnds:

```shell
$ gcli list
```

to limit returned results pass `pattern`

```shell
$ gcli list re*   # Returns all commands matching the pattern
```

### Output Format

The API responses can be formatted as `csv`, `json`, `pretty`, `table`.

By default responses are in tabular format. Tables are available in `horizontal` and `vertical` mode. To enforce table display pass `:h` and `:v` respectively. Otherwise a default orientation will be picked depending on the request made and terminal size.


![Command](https://github.com/peter-murach/github_cli/raw/master/screenshots/command.png)

To get `csv` formatting for easy command piping do

```shell
gcli repo ls -u wycats --format=csv
```

### Output Paging

By default all responses are paged. You can switch off paging by supplying `no-pager` flag.

```shell
gcli --no-pager user ls -u wycats
```

Also you can supply you preferred `pager`, otherwise the paging program is taken from environment variable PAGER if defined or defaults to "less".

### API

Interact with git data:

```shell
$ gcli blob
$ gcli commit
$ gcli ref
$ gcli tag
$ gcli tree
```

Interact with issues:

```shell
$ gcli issue
$ gcli label
$ gcli milestone
$ gcli comment
```

Interact with repositories:

```shell
$ gcli repo
$ gcli collab
$ gcli content
$ gcli download
$ gcli fork
$ gcli hook
$ gcli key
$ gcli watching
```

Interact with gists:

```shell
$ gcli gist
```

Interact with users:

```shell
$ gcli user
$ gcli email
$ gcli follower
```

Interact with organizations:

```shell
$ gcli org
$ gcli member
$ gcli team
```

Interact with authorizations:

```shell
$ gcli auth
```

Interact with search:

```shell
$ gcli search
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Piotr Murach. See LICENSE for further details.
