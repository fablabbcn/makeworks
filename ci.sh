#/bin/bash
. ~/.nvm/nvm.sh
nvm install
nvm use
npm install -g yarn
rake db:create && yarn install --check-files && rake test && rake test:system
