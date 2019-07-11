#!/bin/bash
NET_SET=$(./config_files/create_net_set.sh)

printf "\n"
printf "|%15s|%15s|%15s|%15s|\n" \
  "---------------" "---------------" "---------------" "---------------"
printf "|%15s|%15s|%15s|%15s|\n" \
  "<net name>" "TensorFlow" "Caffe" "ONNX"
printf "|%15s|%15s|%15s|%15s|\n" \
  "---------------" "---------------" "---------------" "---------------"
COUNTER=0
for SUB_STR in $NET_SET
do
  COUNTER=$((COUNTER+1))
  if [[ $COUNTER != "4" ]]
  then
    printf "|%15s" $SUB_STR
  else
    printf "|%15s|\n" $SUB_STR
    COUNTER=0
  fi
done

printf "|%15s|%15s|%15s|%15s|\n" \
  "---------------" "---------------" "---------------" "---------------"
printf "\n"
