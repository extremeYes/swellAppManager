#!/usr/bin/env -S pwsh -nop

function tootPrint {
    param(
        [string]$message = ''
    )
    Write-Host -ForegroundColor DarkBlue "WinToot" $message
}

# # Uncomment this for a fresh Windows install
# tootPrint "installing scoop..."
# # this is the official install method from scoop.sh
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

tootPrint "will now install your stuff!"
Start-Sleep -m 500
Write-Host -ForegroundColor DarkBlue -NoNewline "."
Start-Sleep -m 500
Write-Host -ForegroundColor DarkBlue -NoNewline "."
Start-Sleep -m 500
Write-Host -ForegroundColor DarkBlue "."
Start-Sleep -m 500

tootPrint "adding buckets (main, extras, nonportable)..."
scoop bucket add main
scoop bucket add extras
scoop bucket add nonportable

tootPrint "installing 7zip, git, sudo, gsudo..."
scoop install 7zip
scoop install git
scoop install sudo
scoop install gsudo

tootPrint "updating scoop stuff..."
scoop update
scoop update -a

tootPrint "clearing cache data..."
scoop cache rm -a
scoop cleanup -a

tootPrint "done!"
