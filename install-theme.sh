#!/bin/bash

THEMES_DIR=~/dotfiles/themes
COMMON_DIR=~/dotfiles/common
TARGET_DIR=~/.config

if [ -d "$THEMES_DIR/$1" ]; then
  cp -r "$THEMES_DIR/$1/"* "$TARGET_DIR/"
  cp -r "$COMMON_DIR/"* "$TARGET_DIR/"
  echo "Theme $1 applied to $TARGET_DIR"
else
  echo "Theme $1 does not exist in $THEMES_DIR"
  exit 1
fi

