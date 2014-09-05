Autostager
==========

Automatically stage a local directory based on Github pull request.

[![Build Status](https://api.shippable.com/projects/53f217676ac7a5580608058a/badge/master)](https://www.shippable.com/projects/53f217676ac7a5580608058a)
[![Build Status](https://travis-ci.org/jumanjihouse/autostager.svg?branch=master)](https://travis-ci.org/jumanjihouse/autostager)


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

# Override the default 30 second interval.
export sleep_interval=60
```

Then run:

```
autostager
```
