#!/bin/bash
set +x
set -e

# Set output file default or overwrite with CLI input
OUTPUTNAME="outputParsedAndCombined.pcap"
if [ $# -eq 0 ]
  then
    echo "No arguments supplied - setting default output to outputParsedAndCombined.pcap"
    OUTPUTNAME="outputParsedAndCombined.pcap"
elif [ $# -eq 1 ]
  then
    echo "Setting output file to $1"
    OUTPUTNAME="$1"
else
  echo "That's too many arguments; I don't play that stuff."
  exit 1
fi

# Gather a list of pcap files in this directory
declare -a FILESTODO=()
CURRENT=$(pwd)
THESEFILES=$(ls *.pcap)
for file in $THESEFILES; do
  echo "Adding $file"
  THISFILE="$CURRENT/$file"
  FILESTODO+=("$THISFILE")
done

# Combine files
mergecap -F pcap -v ${FILESTODO[@]} -w tempoutputcombined.pcap

# Use TShark to desegment TCP packets
tshark -r tempoutputcombined.pcap -R "http" -o tcp.desegment_tcp_streams:TRUE -w $OUTPUTNAME
