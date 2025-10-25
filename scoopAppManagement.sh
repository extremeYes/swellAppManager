#!/usr/bin/env bash

# here=${0%/*} # same as:
here=$(dirname "$0")

echo 'Getting list of installed apps...'

# pwsh -nop -c "scoop list | % name > $here/.installed.txt" 1>/dev/null
# shellcheck disable=SC2016
pwsh -nop -c '(scoop list 6>$null).Name' > "$here/.installed.txt"

# OPTION 1
echo "Generating 'to-install' list..."

# grep -vFx -f "$here/.installed.txt" "$here/ScoopApps.txt" > "$here/to-install.txt"
rg --crlf -vFx -f "$here/.installed.txt" "$here/ScoopApps.txt" > "$here/to-install.txt"

echo "Generating 'to-note' list..."

# grep -vFx -f "$here/ScoopApps.txt" "$here/.installed.txt" > "$here/to-note.txt"
rg --crlf -vFx -f "$here/ScoopApps.txt" "$here/.installed.txt" > "$here/to-note.txt"

# # OPTION 2
# comm -13 <(sort "$here/.installed.txt") <(sort "$here"/ScoopApps.txt) > "$here/to-install.txt"

# comm -23 <(sort "$here/.installed.txt") <(sort "$here"/ScoopApps.txt) > "$here/to-note.txt"

echo 'Done!'
