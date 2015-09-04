#!/bin/bash

cp -f templates/credentials ~/.gem/
chmod 0600 ~/.gem/credentials
sed -i "s/API_KEY/${API_KEY}/" ~/.gem/credentials

gem search --remote -a puppet-autostager | grep ${VERSION}
if [[ $? -eq 0 ]]; then
  # Be informative, but don't fail.
  # This enables to merge changes to non-gem files, such as README.
  echo "puppet-autostager ${VERSION} has already been published."
else
  gem push puppet-autostager-${VERSION}.gem
fi