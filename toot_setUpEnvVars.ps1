
function writeEnvVars {
    Write-Host "Setting up your environment variables:"
    Write-Host

    foreach ($key in $myEnvVars.Keys) {
        [System.Environment]::SetEnvironmentVariable($key, $myEnvVars[$key], 'User')
        Write-Host "$key = $($myEnvVars[$key] | Out-String -NoNewline)"
    }

    Write-Host
    Write-Host "Done."
}

function nullifyEnvVars {
    Write-Host "Removing your environment variables:"
    Write-Host

    foreach ($key in $myEnvVars.Keys) {
        [System.Environment]::SetEnvironmentVariable($key, $null, 'User')
        Write-Host "$key" '= $null'
    }

    Write-Host
    Write-Host "Done."
}


# --- USERSPACE: ---

# place your desired vars here:
$myEnvVars = @{
    "EDITOR" = "nvim"
    "XDG_CONFIG_HOME" = "C:\Users\vic\.config"
    "XDG_DATA_HOME" = "C:\Users\vic\.local\share"
    "NVIM_APPNAME" = "nvim"
}

# uncomment your desired action:
# writeEnvVars
# nullifyEnvVars
