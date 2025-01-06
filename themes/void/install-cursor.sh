#!/bin/bash

mkdir -p ~/.icons

if [ ! -d "$HOME/.icons/ArcMidnight-Cursors" ]; then 
  echo "- Installing ArcMidnight cursor..."
  REPO="https://github.com/yeyushengfan258/ArcMidnight-Cursors.git"
  echo "  - Downloading from \"$REPO\""
  git clone $REPO /tmp/ArcMidnight-Cursors 2> /tmp/ArcMidnight-Cursors.log
  
  echo "  - Installing to \"$HOME/.icons\""
  mv /tmp/ArcMidnight-Cursors/dist ~/.icons/ArcMidnight-Cursors
  
  echo "  - Cleaning up..."
  rm /tmp/ArcMidnight-Cursors{,.log} -rf
fi
