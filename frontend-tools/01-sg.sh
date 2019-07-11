#!/bin/bash
NET_NAME=$2
mkdir -p ../caisa-models
case $1 in
  tf)
    FRONT_END=".pb"
    ;;
  caffe)
    FRONT_END=".caffemodel"
    ;;
  onnx)
    FRONT_END=".onnx"
    ;;
  *)
    FRONT_END="!>_@#"
    ;;
esac

FILES=$(ls ../reference-models/$NET_NAME | grep "$FRONT_END")
if [[ $FILES == "" ]]
then
  echo "Usage: $0 [OPTIONS] <net name>"
  echo ""
  echo "[OPTIONS] tf     # for TensorFlow Model"
  echo "          caffe  # for Caffe Model"
  echo "          onnx   # for onnx Model"
  echo ""
  echo "Available front end models are listed below"
  ./10-list.sh
  exit 0
fi

# Write the RbCli code
echo "Off you go"
