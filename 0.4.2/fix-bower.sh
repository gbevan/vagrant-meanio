#!/bin/bash

# run as vagrant user

cd ~/appserver || exit 1
#sed -i.bak \
#  -e 's/"angular": ".*"/"angular": "1.4.0"/' \
#  -e 's/"angular-resource": ".*"/"angular-resource": "1.4.0"/' \
#  -e 's/"angular-cookies": ".*"/"angular-cookies": "1.4.0"/' \
#  -e 's/"angular-mocks": ".*"/"angular-mocks": "1.4.0"/' \
#  -e 's/"angular-route": ".*"/"angular-route": "1.4.0"/' \
#  -e 's/"angular-touch": ".*"/"angular-touch": "1.4.0"/' \
#  -e 's/"angular-sanitize": ".*"/"angular-sanitize": "1.4.0"/' \
#  -e 's/"angular-marked": ".*"/"angular-marked": "0.0.21"/' \
#  -e 's/"angular-clipboard": ".*"/"angular-clipboard": "1.3.0"/' \
#  -e 's/"si-table": ".*"/"si-table": "0.2.3"/' \
#  -e 's/"angular-ui-router": ".*"/"angular-ui-router": "0.2.15"/' \
#  bower.json

cat >bower.json <<EOF
{
  "name": "mean",
  "version": "0.4.1",
  "dependencies": {
    "jquery": "1.x",
    "angular": "1.4.0",
    "angular-resource": "1.4.0",
    "angular-cookies": "1.4.0",
    "angular-mocks": "1.4.0",
    "angular-route": "1.4.0",
    "bootstrap": "3.1.1",
    "angular-bootstrap": "0.11.0",
    "angular-ui-router": "0.2.15"
  },
  "resolutions": {
    "angular": "1.4.0"
  }
}
EOF
