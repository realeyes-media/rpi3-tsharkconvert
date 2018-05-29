#!/bin/bash
set -x

# Gather a list of pcap files in this directory
declare -a FILESTODO=()
CURRENT=$(pwd)
for file in *.pcap; do
  [ -f "$file" ] || break
  THISFILE="$CURRENT$file"
  FILESTODO+="$THISFILE"
done

# Echo out files about to be combined
echo ${myarray[@]}
