#!/bin/sh
cd $(pwd)
for k in $(grep -r "import" | cut -d' ' -f2 | sort --unique);do pip install  $k;done;