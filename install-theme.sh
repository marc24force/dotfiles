#!/bin/bash

THEMES_DIR=$HOME/dotfiles/themes
COMMON_DIR=$HOME/dotfiles/common
TARGET_DIR=$HOME/.config

if [ -z "$1" ]; then
  echo "Usage: $0 <theme>"
  exit 1
fi

mkdir -p $TARGET_DIR

if [ -d "$THEMES_DIR/$1" ]; then
  echo "- Installing [$1] theme..."
  cp -r "$THEMES_DIR/$1/"*/ "$TARGET_DIR/"
  cp -r "$COMMON_DIR/"* "$TARGET_DIR/"
  cp "$COMMON_DIR/".bashrc "$HOME/"
  $THEMES_DIR/$1/install-cursor.sh
  echo ""
  echo "Theme [$1] applied"
else
  echo "Theme $1 does not exist"
  exit 1
fi

