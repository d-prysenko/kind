#!/bin/bash
# Copyright 2020 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# script to setup go version with gimme as needed
# MUST BE RUN FROM THE REPO ROOT DIRECTORY

# read go-version file unless GO_VERSION is set
#GO_VERSION="${GO_VERSION:-"$(cat .go-version)"}"

# we don't actually care where the .env files are
# however, GIMME_SILENT_ENV doesn't trigger re-generating a .env if it
# already exists and isn't "silent" (no `go version` command in it)
# so we fix that by changing where the .env is written, ensuring ours
# is generated from this repo and silent.
# export GIMME_ENV_PREFIX=./bin/.gimme/
# export GIMME_SILENT_ENV=y

export CGO_ENABLED=0
GO_VERSION="go1.19.1.linux-amd64"

wget https://go.dev/dl/$GO_VERSION.tar.gz
tar -C /root -xzf $GO_VERSION.tar.gz
rm -rf $GO_VERSION.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo Go setup complete
go version

# force go modules
export GO111MODULE=on
