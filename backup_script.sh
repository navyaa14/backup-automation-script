#!/bin/bash

TIME=$(date "+%Y-%m-%d_%H-%M-%S")
SRC="./data"

if [ ! -d "$SRC" ]; then
  echo "Source folder not found"
  exit 1
fi

tar -czf backup_$TIME.tar.gz "$SRC"

if [ $? -eq 0 ]; then
  echo "Backup successful: backup_$TIME.tar.gz"
  du -h backup_$TIME.tar.gz
else
  echo "Backup failed"
fi
