#!/usr/bin/env bash

# Import subscripts -----------------------------
source ./usage.sh

# Script local variables ------------------------
APP_NAME="$0"
dbg() {
    echo "[DEBUG] $@"
    if [ $VERBOSITY -eq 1 ]; then
        $@
    fi
}
DEBUG_SCRIPT=0
DEBUG=""
VERBOSITY=0
CONFIG_FILE=""
CUR_DIR=$(pwd)
MYDIR=$(dirname $(greadlink -f $0))
ALWAYS_YES=0
REMOTE_NAME="origin"
REMOTE_URL=""
REPO_PATH=""

# Argument checking -----------------------------
ARGS_OK=0
DEST=
SRC=
SRC_OPT=0
OPTS=$(getopt -o hvDr:s:f --long help,verbose,listdest:,src:,debug,force -n "'$APP'" -- "$@")

# Process flags ---------------------------------
while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help) usage $APP_NAME; exit 0; shift;;
    --repo) REPO_PATH="$2"; shift 2;;
    --remote-name|-r)
        REMOTE_NAME="$2"; shift 2;;
    --remote-url|-u)
        REMOTE_URL="$2"; shift 2;;
    -v|--verbose) VERBOSITY=1; shift;;
    -D|--debug) DEBUG_SCRIPT=1; shift;;
    --) shift; break;;
    *) break;;
  esac
done

# Check that we have all the info we need -------
if [ -z $REMOTE_URL ]; then
    echo "[ERROR] Please specify a remote URL"
    usage $APP_NAME
    exit 1
done

# Check that we are indeed in a git repository --

