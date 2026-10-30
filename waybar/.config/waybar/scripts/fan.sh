#!/bin/bash
current=$(nbfc status --fan=0 | grep Current | sed -E 's/.*:[[:space:]]*([0-9]+)\.[0-9]+/\1/')
echo "$current 󰈐"
