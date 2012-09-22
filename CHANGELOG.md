0.5.2 (September 22, 2012)

* Fix bug with Ruby 1.8 and passing arguments in add and replace label api
* Fix ui component in Ruby 1.8 and add newline param
* Update dependencies.
* Fix table formatting in Ruby 1.8.
* Change watching api to new subscribers api.
* Add starring api commands.
* Fix bug preventing listing of your authorizations.

0.5.1 (September 16, 2012)

* Fix bug - failure to load vendored dependencies.
* Remove *ghc* executable.

0.5.0 (August 17, 2012) - IMPORTANT!!!

* Change editor settings to seek first local config before system properties.
* Change config key format and add config file location setup.
* Change init command to allow for local and global config files.
* Add new default configuration options to .githubrc file.
* Fix bug with setting config file options.
* Add pretty printing of config entries with pattern matching.
* Add config command for setting, unsetting and listing of options with tests.
* Change executable command name from *ghc* to *gcli*
* Add manpages for gcli executable and config command.
* Setup automatic manpage trigger on help command.
* Add raketask for vendoring gems and vendor thor.

0.4.4 (July 15, 2012)

* Fix bug with tree retrieval and add feature tests.
* Add repository, tag api commands feature tests.
* Fix bug with listing references and add feature tests.
* Fix bugs with pull requests api and add feature tests.
* Add watching, search api commands tests.
* Fix bug when adding team repository and add feature tests.
* Fix bug when editing organization and add feature tests.
* Fix bug with listing issue on a repository and add tests.
* Fix bug with updating milestone and add milestone api tests.
* Improve overal command interface with explicit names and parameters.

0.4.3 (July 14, 2012)

* Add communist gem dependency.
* Fix bug with getting blob data and add blob api feature tests.
* Fix bug with getting commit data and add commit api feature tests.
* Fix bug with removing collaborator and add feature tests.
* Add content, download, email api commands feature tests.
* Fix bug with missing event api inclusion and add feature tests.
* Fix bug with checkig if user is a follower and add feature tests.
* Fix bug with listing starred gists and add gist api feature tests.
* Add hook api commands feature tests.
* Fix bugs with labels api coammands using old github_api gem method calls.

0.4.2 (July 12, 2012)

* Add 'did you mean' help for mistyped commands.
* Add utility function for finding common prefix.
* Extract command usage and completion classes.
* Fix bug with all commands listing.
* Add arguments parser for required and optional arguments.
* Add non-required argument parsing to repository creation.
* Add new error type for required arguments.
* Fix bug with creating authorizations.

0.4.1 (June 28, 2012)

* Add search api commands.
* Add repo content api commands.
* Remove params from all commands up to command.
* Add more feature tests for the command interface.

0.4.0 (June 15, 2012)

* Add user api commands.
* Add user followers api commands.
* Add organizations api commands.
* Add organization members api commands.
* Add organization teams api commands.
* Add gem logo.
* Add system configuration utilities.
* Add response pager to automatically paginate long output with ability to switch
  it off as well as specify custom pager command.
* Fix issue with output formatting when simple string response is returned.
* Add interface feature tests.
* Add printing of command usage information.
* Refactor utility methods.
* Add new formatter for the output rendering.
* Refactor table & csv output, add vertical & horizontal table rendering.
* Add utility methods for string truncation and padding.
* Add ability to output to editor.
* Update gem dependecies and gem summary.

0.3.1 (May 30, 2012)

* Add milestone api commands.
* Add emails api commands.
* Add events api commands.
* Fix bug with configuration access.
* Add thor extensions.

0.3.0 (May 13, 2012)

* Add output formatting.
* Add gists api commands.
* Add collaborators api commands.
* Add issues api commands.
* Add error handling for the executable.
* Setup feature testing environment.

0.2.1 (April 30, 2012)

* Add authorizations api commands.

0.2.0 (April 29, 2012)

* Add repository forks, hooks, watching api commands.
* Fix repository commands bugs.
* Update gem dependency to 'github_api' version 0.5.0 and rewrote method calls to match new dsl conventions.
