#!/bin/sh
set -eu

bundle install
exec bundle exec jekyll "$@"
