#!/bin/bash

mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.325.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.325.0/actions-runner-linux-x64-2.325.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.325.0.tar.gz
./config.sh --url https://github.com/nhutlin/portfolio-website --token EXAMPLE_TOKEN
sudo ./svc.sh install
sudo ./svc.sh start