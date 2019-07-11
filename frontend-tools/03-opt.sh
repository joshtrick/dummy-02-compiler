#!/bin/bash
NET_NAME=$1
mkdir -p ../caisa-models
FILES=$(ls ../caisa-models/$NET_NAME | grep $NET_NAME"_quant_sg.pbtxt")
if [[ $FILES == "" ]]
then
  echo "Usage: $0 [OPTIONS] <net name>"
  echo ""
  echo "Available front end models are listed below"
  ./10-list.sh
  echo "Make sure if you have done step 01 and 02 properly."
  exit 0
fi

# Write the RbCli code
echo "Off you go"
