#!/bin/bash

t="0"
function checkStatus()
{
  pmset -g ps | grep "%" > ~/.local/tmp/battChargedNotifier/tmp.txt
  read a b c d < ~/.local/tmp/battChargedNotifier/tmp.txt
  if [ "$c" != "$t" ]
  then
  {
    echo "${c} Charging..."
  }
  fi
  t=$c
  if [ "$c" = "100%;" ]
  then
    sleep 300
    repeatSound
  else
    sleep 60
    checkStatus
  fi
}

function repeatSound()
{
  open ~/.local/tmp/battChargedNotifier/pikachu_alert.m4a
  sleep 10
  repeatSound
}

checkStatus
