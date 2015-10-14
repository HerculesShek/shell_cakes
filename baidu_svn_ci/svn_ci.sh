#!/bin/bash
arg_1=$0 # file name no parent
filename=$(basename $arg_1)
filepath=$(cd `dirname $0`; pwd) # current path
cmdpath=$(pwd)

hostdir="/Users/baidu/PhpstormProjects"
parpath=$(dirname $cmdpath)
if [ $hostdir != $parpath ]
then
    echo "wrong current path make sure u're in $hostdir but $parpath"
    exit 1
fi

pythonup=${hostdir}"/upload.py"
cor_flag="cooder.baidu.com"
last_line=$(echo "y\nf_s\n" | python $pythonup | tail -1 | grep $cor_flag)

if [ -z "$last_line" ]; then
    echo "generate issueid error..."
    exit 2
fi

issue_id=${last_line##*/}
echo "issud id is " $issue_id
svn ci -m "ISSUE=$issue_id"
echo "svn commit ok!"

exit 0

