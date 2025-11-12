
$here = $PSScriptRoot

echo 'Getting list of installed apps...'

(scoop list 6>$null).Name > "$here\.installed.txt"

echo "Generating 'to-install' list..."

rg --crlf -vFx -f "$here/.installed.txt" "$here/ScoopApps.txt" > "$here/to-install.txt"

echo "Generating 'to-note' list..."

rg --crlf -vFx -f "$here/ScoopApps.txt" "$here/.installed.txt" > "$here/to-note.txt"

echo 'Done!'
