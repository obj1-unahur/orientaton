#!/bin/bash
cd "$(xdg-user-dir DESKTOP)/orientaton" || exit 1
git restore .
git clean -fd

#chmod +x "$(xdg-user-dir DESKTOP)/reset.sh