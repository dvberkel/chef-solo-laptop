#! /usr/bin/env bash

# Provision Computer
chef-solo -c solo.rb -j solo.json
