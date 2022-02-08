#!/usr/bin/env bash
org=$1
mkdir "$org""_org" && cd "$org""_org" || exit
for url in $(curl "https://api.github.com/orgs/$org/repos?per_page=200" | grep 'ssh_url' | cut -d':' -f 2-3 | tr -d \",); do
	git clone "$url";
done;
cd ..;