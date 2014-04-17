#!/usr/bin/env bash

alias ss='svn status'
function svnloggrep ()
{
  svn log | grep -B2 $1;
}

function svnshow ()
{
  svn diff -r $(($1-1)):$1 $2 | vim -R -;
}
