#!/bin/bash
sed -e 's/Super/Alt/g' -e 's/\/Users\/test/\/home\/haskell/g' config.kdl > asdf.kdl && mv asdf.kdl config.kdl
sed -e 's/Super/Alt/g' -e 's/\/Users\/test/\/home\/haskell/g' ./layouts/custom.kdl > asdf.kdl && mv asdf.kdl ./layouts/custom.kdl
