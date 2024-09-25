#/bin/sh
. ~/.nvm/nvm.sh
nvm use
rake db:create && yarn install --check-files && rake test && rake test:system
