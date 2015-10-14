#!/bin/bash

arg_1=$0
filename=$(basename $arg_1)
filepath=$(cd `dirname $0`; pwd)
cmdpath=$(pwd)


echo $filename
echo $arg_1
echo $filepath
echo $cmdpath
