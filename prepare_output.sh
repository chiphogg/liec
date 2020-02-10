#!/bin/bash

# The end goal for this script: make `output/DIRNAME` exist, and have
# `DIRNAME/output` be a symlink to it.
#
# If `DIRNAME/output` had any content before, we'll migrate it over to
# `output/DIRNAME`.

ERR_BAD_ARG_CNT=1
ERR_NO_DIRNAME=2

Usage() { echo "Usage: ${0##*/} <folder-name>"; exit "$1"; }
Die() { echo "${0##*/}: fatal: $1"; exit "$2"; }

[ $# -eq 1 ] || Usage "$ERR_BAD_ARG_CNT"

DIRNAME="${1%/}"
[ -d "$DIRNAME" ] || Die "Folder '$DIRNAME' not found" "$ERR_NO_DIRNAME"

REAL_FOLDER="output/$DIRNAME"
SYMLINK="$DIRNAME/output"

# Ensure the real folder exists.
mkdir -p "$REAL_FOLDER"

# If there's an old, *actual* folder where the symlink should be, migrate all
# its contents to the canonical location, and replace it with a symlink.  This
# is purely for efficiency: we could just blow away the old folder and
# regenerate everything, but we might as well not redo work we don't have to.
if [[ -d "$SYMLINK" && ! -L "$SYMLINK" ]]
then
  [[ $(ls -A "$SYMLINK") ]] && mv "$SYMLINK/"* "$REAL_FOLDER"
  rm -Rf "$SYMLINK"
fi

# Create the symbolic link.
rm -f "$SYMLINK"
ln -srf "$REAL_FOLDER" "$SYMLINK"
