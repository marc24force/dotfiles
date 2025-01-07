#!/bin/bash

mkdir -p ~/.icons

CURSOR_NAME="ArcDusk"

if [ ! -d "$HOME/.icons/$CURSOR_NAME" ]; then 
  echo "- Installing $CURSOR_NAME cursor..."
  REPO="https://github.com/yeyushengfan258/ArcDusk-Cursors.git"
  echo "  - Downloading from \"$REPO\""
  git clone $REPO /tmp/$CURSOR_NAME 2> /tmp/$CURSOR_NAME.log
  echo "  - Installing to \"$HOME/.icons\""
  mv /tmp/$CURSOR_NAME/dist ~/.icons/$CURSOR_NAME
  echo "  - Cleaning up..."
  rm /tmp/$CURSOR_NAME{,.log} -rf
fi
echo -e "[Icon Theme]\nName=Default\nComment=Default Cursor Theme\nInherits=$CURSOR_NAME" > $HOME/.icons/default/index.theme
  
