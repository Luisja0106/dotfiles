#!/usr/bin/env bash 

session=$(herdr session list --json | jq -r ".sessions | .[] | .name" | tv)

if [[ -n "$session" ]]; then
  herdr session attach "$session"
fi
