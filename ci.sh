#/bin/sh
rake db:create && yarn install --check-files && rake test && rake test:system
