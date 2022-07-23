#!/usr/bin/env bash
host=$HOSTNAME
date=$(date | cut -d' ' -f 1-4)
cd && cd Documents/ && git pull && obsidian && git add . && git commit -s -m " Auto Commit on Close at $host - $date  " && git push
