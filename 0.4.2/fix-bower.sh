#!/bin/bash

# run as vagrant user

cd ~/appserver || exit 1
sed -i.bak \
  -e 's/"angular": ".*"/"angular": "1.4.0"/' \
  -e 's/"angular-resource": ".*"/"angular-resource": "1.4.0"/' \
  -e 's/"angular-cookies": ".*"/"angular-cookies": "1.4.0"/' \
  -e 's/"angular-mocks": ".*"/"angular-mocks": "1.4.0"/' \
  -e 's/"angular-route": ".*"/"angular-route": "1.4.0"/' \
  -e 's/"angular-touch": ".*"/"angular-touch": "1.4.0"/' \
  -e 's/"angular-sanitize": ".*"/"angular-sanitize": "1.4.0"/' \
  -e 's/"angular-marked": ".*"/"angular-marked": "0.0.21"/' \
  -e 's/"angular-clipboard": ".*"/"angular-clipboard": "1.3.0"/' \
  -e 's/"si-table": ".*"/"si-table": "0.2.3"/' \
  -e 's/"angular-ui-router": ".*"/"angular-ui-router": "0.2.15"/' \
  bower.json
