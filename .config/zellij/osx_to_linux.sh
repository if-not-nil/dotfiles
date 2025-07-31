#!/bin/bash
sed -e 's/Super/Alt/g' -e 's/\/Users\/test/\/home\/user/g' config.kdl > asdf.kdl && mv asdf.kdl config.kdl
sed -e 's/Super/Alt/g' -e 's/\/Users\/test/\/home\/user/g' ./layouts/custom.kdl > asdf.kdl && mv asdf.kdl ./layouts/custom.kdl
