#!/usr/bin/env -S bash

tootPrint() {
    echo -e "\e[34mWinToot $*\e[m"
}

tootPrint "updating scoop stuff..."
scoop update
scoop update -a

tootPrint "clearing cache data..."
scoop cache rm -a
scoop cleanup -a

tootPrint "done!"
