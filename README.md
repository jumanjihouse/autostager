Autostager
==========

Automatically stage a local directory based on Github pull request.

Build status for master branch: [![Circle CI](https://circleci.com/gh/jumanjihouse/autostager/tree/master.svg?style=svg&circle-token=a5b167be1f709009108ca0aaec1613fd9e843cc1)](https://circleci.com/gh/jumanjihouse/autostager/tree/master)


Installation
------------

Add this line to your application's Gemfile:

    gem 'puppet-autostager'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install puppet-autostager


Usage
-----

Create an access token as described at
https://github.com/octokit/octokit.rb#oauth-access-tokens
then export a few environment variables:

```
export repo_slug=ISEexchange/puppet
export access_token=<your 40-char token>
export base_dir=/tmp/puppet/environments
export debug=anything

# Set a timeout for git operations (default 120 seconds).
export timeout=180

# Override the default 30 second interval.
export sleep_interval=60

# Or run as a single-shot operation.
export sleep_interval=0
```

Then run:

```
autostager
```


Build workflow
--------------

We use CircleCI to build and publish to rubygems.org:

![simplified workflow](assets/rubygems-workflow.png)

If build is clean on master branch, CircleCI pushes the
built gem to [https://rubygems.org/gems/puppet-autostager](https://rubygems.org/gems/puppet-autostager).
