#!/bin/bash

# Usage:
#  ./drupal.sh --init="site"

set -x # echo on

root="site"

function download_drupal()
{
    wget --quiet "https://ftp.drupal.org/files/projects/$1"
    tar -xzf "$1" -C "$root/" --strip-components=1
    rm -f "$1"
}

function init()
{
    rm -rf "$root/"
    mkdir -p "$root/"
    download_drupal "drupal-6.22.tar.gz"  # https://www.drupal.org/project/drupal/releases/6.22
}

for i in "$@"
do
case $i in
    -i=*|--init=*)
    root="${i#*=}"
    init
    shift # past argument=value
esac
done
