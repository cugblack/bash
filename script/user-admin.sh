#!/usr/bin/env bash

DEBUG=0
add=0
DEL=0
for I in '`seq 1 $#`';do
case $1 in
-v|--verbose)
  DEBUG=1
  shift ;;
-a|--add)
  add=1
  addusers=$2
  shift 2 ;;
-d|--del)
  DEL=1
  delusers=$2
  shift 2 ;;
-h|--help)
  echo " -a|--add   -d|--del   -h|--help"
  exit 1 ;;
*)
  echo "Only -a|--add  -v|--verbose  -d|--del" ;;
esac
done
if [ $add -eq 1 ] ; then
  for USER in `echo $addusers | sed 's/,/ /g'`;do
    if id $USER &>/dev/null ;then
      echo "$USER EXISTS!"
    else
      useradd $USER && echo $USER | passwd -stdin $USER &>/dev/null
      echo "user $USER add success! Passwd same like username!"
    fi
  done
fi
if [ $DEL -eq 1 ] ; then
  for USER in `echo $delusers | sed 's@,@ @g'`;do
    if id $USER &>/dev/null ;then
      userdel -r $USER
      echo "user $USER delete succsee!"
    else
      echo "no such user named $USER"
    fi
  done
fi





