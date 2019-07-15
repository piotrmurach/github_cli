<div align="center">
  <a href="http://piotrmurach.github.io/github/"><img width="136" src="https://github.com/piotrmurach/github_cli/raw/master/assets/github_api.png" alt="github api logo" /></a>
</div>

# [GithubCLI](https://piotrmurach.github.io/github/)

[![Gem Version](https://badge.fury.io/rb/github_cli.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/github_cli.svg?branch=master)][travis]
[![Build status](https://ci.appveyor.com/api/projects/status/dw97iaycnu9ea6u0?svg=true)][appveyor]
[![Maintainability](https://api.codeclimate.com/v1/badges/38e4d21b00806fd865c1/maintainability)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/github_cli/badge.svg?branch=master)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/github_cli.svg)][inchpages]

[gem]: http://badge.fury.io/rb/github_cli
[travis]: http://travis-ci.org/piotrmurach/github_cli
[appveyor]: https://ci.appveyor.com/project/piotrmurach/github-cli
[codeclimate]: https://codeclimate.com/github/piotrmurach/github_cli/maintainability
[coverage]: https://coveralls.io/github/piotrmurach/github_cli
[inchpages]: http://inch-ci.org/github/piotrmurach/github_cli

> GitHub on your command line. User your terminal, not the browser. Works hand-in-hand with `github_api` gem.

![Interface](https://github.com/piotrmurach/github_cli/raw/master/assets/interface.png)

## Installation

Add this line to your application's Gemfile:

    gem 'github_cli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github_cli

## Contents

* [1. Usage](#1-usage)
* [2. Interface](#2-interface)
  * [2.1. Configuration file](#21-configuration-file)
  * [2.2. Authorization](#22-authorization)
  * [2.3. Arguments](#23-arguments)
  * [2.4. Listing commands](#24-listing-commands)
  * [2.5. Subcommands](#25-subcommands)
  * [2.6. Output formatting](#26-output-formatting)
  * [2.7. Output paging](#27-output-paging)
* [3. API](#3-api)
* [4. Development](#4-development)

## 1. Usage

Run it:

```shell
$ gcli
```

## 2. Interface

### 2.1 Configuration file

The first step is to create a configuration file, either global in home directory or local inside the project:

```shell
$ gcli init [--local|-l]
```

Without any options this command will setup a `.gcliconfig` configuration file in your home directory with all the global settings. By passing `--local` option the config file will be created locally in the current directory.

Main configuration options are:

```
user.token            # Authentication token
user.login            # User login
user.password         # User password
user.name             # Default user name
user.repo             # Default repo name
user.org              # Default organization name
core.editor           # Editor to be opened
core.endpoint         # The api endpoint, by default https://api.github.com
core.site             # The web endpoint, by default https://github.com
core.pager            # Pager to be used, by default less
core.format           # Output formating
core.quiet            # Surpass output to show only response status
core.ssl              # SSL settings
core.auto_pagination  # Switch on default results pagination, default false
```

Moreover, `gcli config` command allows you to set/get any configuration option such as output format, editor or oauth token.

For instance, to check value for your `authentication token` do

```shell
$ gcli config user.token
```

And to set the value do

```shell
$ gcli config user.token lh23l4kj234....
```

To list specific options

```shell
$ gcli config --list [regex]
```

To edit config in your favourite editor:

```shell
$ gcli config -e
```

Finally, to see a manpage about available configuration options do

```shell
$ gcli help config
```

### 2.2 Authorization

To create oauth tokens you need to setup your basic authentication.

You can either set it up manually like so

```shell
$ gcli init
$ gcli config user.login '...'
$ gcli config user.password '...'
```

Then to create your token do

```shell
$ gcli auth create --scopes=repo --note=github_cli --note-url=http://github.com/piotrmurach/github_cli
```

Alternatively `authorize` command has been provided that will guide you through authentication process by asking questions and then save the credentials to `.githubrc` file. Example

```shell
$ gcli authorize
```

To see your current tokens do

```shell
$ gcli auth ls
```

To see current tokens without configuration file pass `--login` and `--password` flags like so

```shell
$ gcli auth ls --login=... --password=...
```

Finally to add the token to your config do

```shell
$ gcli config user.token '...'
```

### 2.3. Arguments

The required arguments come first as per command description, then are followed by the optional arguments supplied as specific options.

For instance, one can create repository by supplying parameters in the following way:

```shell
$ gcli repo create github_api --desc='Test repo for kitty.'
```

To create repository inside organization:

```shell
$ gcli repo create github/github_api --desc='Test repo for kitty.'
```

To provide array argument, pass space delimited strings like so

```
$ gcli hook create <user> <repo> --events=push issues status
```

To provide hash argument, pass space delimited key:value pairs such as

```
$ gcli hook create <user> <repo> --config=url:"http://example.com/path" content_type:json
```

To find out which options are required and which are optional use `help` command:

```shell
$ gcli repo help create
```

### 2.4. Listing commands

You can list all GitHub APIs commands:

```shell
$ gcli list
```

to limit returned results pass `pattern`

```shell
$ gcli list re*   # Returns all commands matching the pattern
```

### 2.5. Subcommands

To see a list of subcommands that a given command provides just type top-level command like so

```shell
$ gcli repo
```

### 2.5. Output formatting

The API responses can be formatted as `csv` or `table`.

By default responses are in tabular format. Tables are available in `horizontal` and `vertical` mode. To enforce table display pass `:h` and `:v` respectively. Otherwise a default orientation will be picked depending on the request made and terminal size.


![Command](https://github.com/piotrmurach/github_cli/raw/master/assets/command.png)

To get `csv` formatting for easy command piping do

```shell
gcli repo ls -u wycats --format=csv
```

To suppress output pass `--quiet` option like so

```shell
gcli repo create ... --quiet=true
```

### 2.6. Output paging

By default all responses are paged. You can switch off paging by supplying `no-pager` flag.

```shell
gcli --no-pager user ls -u wycats
```

Also you can supply you preferred `pager`, otherwise the paging program is taken from environment variable PAGER if defined or defaults to "less".

### 3. API

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
```

Interact with activities:

```shell
$ gcli star
$ gcli watch
$ gcli event
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

## 4. Development

The test suite includes both unit tests and end-to-end tests. The unit tests are in `spec` folder and can be run:

```bash
$ bundle exec rake spec
```

The end-to-end tests are in `features` folder and can be run:

```bash
$ bundle exec rake features
```

In order to run all the tests run:

```bash
$ bundle exec rake [ci]
```

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Bug reports and pull requests are welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Piotr Murach. See LICENSE for further details.
