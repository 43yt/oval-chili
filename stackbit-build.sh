#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dbec48d25643800193511ba/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dbec48d25643800193511ba
curl -s -X POST https://api.stackbit.com/project/5dbec48d25643800193511ba/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dbec48d25643800193511ba/webhook/build/publish > /dev/null
