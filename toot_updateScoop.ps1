#!/usr/bin/env -S pwsh -nop

function tootPrint {
    param(
        [string]$message = ''
    )
    Write-Host -ForegroundColor DarkBlue "WinToot" $message
}

tootPrint "updating scoop stuff..."
scoop update
scoop update -a

tootPrint "clearing cache data..."
scoop cache rm -a
scoop cleanup -a

tootPrint "done!"
