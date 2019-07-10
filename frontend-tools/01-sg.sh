#!/bin/bash
NET_SET=$(./config_files/create_net_set.sh)
case $1 in
  tf)
    FRONT_END=2
    ;;
  caffe)
    FRONT_END=3
    ;;
  onnx)
    FRONT_END=4
    ;;
  *)
    FRONT_END=1
    ;;
esac
NET_NAME=$2
for SUB_STR in $NET_SET
do
  if [ "$APPEND" == "True" ]
  then
    RULE_STR=$RULE_STR" "$SUB_STR
  fi

  if [ "$NET_NAME" == "$SUB_STR" ]
  then
    RULE_STR=$RULE_STR" "$SUB_STR
    APPEND="True"
  fi
done
COMPILER_RULE=$(echo $RULE_STR | cut -d " " -f $FRONT_END)
if [ "$COMPILER_RULE" != "Available" ]
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
