Test harness
============

## Dependencies

* [`bash`](https://www.gnu.org/software/bash/bash.html)
* [`git`](https://github.com/git/git)
* [`pip`](http://www.pip-installer.org) command


## How-to

Run:

    ci/test

Output resembles:

    Run file checks
    [forbid-binary] Forbid binaries..........................................(no files to check)Skipped
    [git-check] Check for conflict markers and core.whitespace errors............................Passed
    [git-dirty] Check if the git tree is dirty...................................................Passed
    [shellcheck] Test shell scripts with shellcheck..............................................Passed
    [yamllint] yamllint..........................................................................Passed
    [check-added-large-files] Check for added large files........................................Passed
    [check-case-conflict] Check for case conflicts...............................................Passed
    [check-executables-have-shebangs] Check that executables have shebangs.......................Passed
    [check-json] Check JSON..................................................(no files to check)Skipped
    [check-merge-conflict] Check for merge conflicts.............................................Passed
    [check-xml] Check Xml....................................................(no files to check)Skipped
    [check-yaml] Check Yaml......................................................................Passed
    [detect-private-key] Detect Private Key......................................................Passed
    [forbid-crlf] CRLF end-lines checker.........................................................Passed
    [forbid-tabs] No-tabs checker................................................................Passed

    Run rubocop and rspec
    Running RuboCop...
    Inspecting 14 files
    ..............

    14 files inspected, no offenses detected

    /usr/bin/ruby -I/home/dev/.bundle/ruby/2.4.0/gems/rspec-core-3.7.1/lib:/home/dev/.bundle/ruby/2.4.0/gems/rspec-support-3.7.1/lib /home/dev/.bundle/ruby/2.4.0/gems/rspec-core-3.7.1/exe/rspec --pattern spec/unit/\*\*/\*_spec.rb

    Autostager
      timeout_seconds
        defaults to 120 seconds
        should use ENV["timeout"] if exists
        fails if timeout is zero
        fails if timeout is negative
        dynamically adjusts based on env var

    Finished in 0.01025 seconds (files took 0.51461 seconds to load)
    5 examples, 0 failures

    ci/test OK
