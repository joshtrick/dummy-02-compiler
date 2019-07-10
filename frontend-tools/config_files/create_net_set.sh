#!/bin/bash
for NET_NAME in $(ls ../reference-models)
do
  NET_SET=$NET_SET" "$NET_NAME
  FILES=$(ls ../reference-models/$NET_NAME)
  if [[ $FILES == *".pb"* ]]
  then
    NET_SET=$NET_SET" Available"
  else
    NET_SET=$NET_SET" N/A"
  fi

  if [[ $FILES == *".caffemodel"* ]]
  then
    NET_SET=$NET_SET" Available"
  else
    NET_SET=$NET_SET" N/A"
  fi


  if [[ $FILES == *".onnx"* ]]
  then
    NET_SET=$NET_SET" Available"
  else
    NET_SET=$NET_SET" N/A"
  fi
done
echo $NET_SET
