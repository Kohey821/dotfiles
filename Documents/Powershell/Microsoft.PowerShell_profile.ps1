# oh my posh

oh-my-posh init pwsh | Invoke-Expression

# cd

function SetLocationUp { Set-Location .. }
New-Alias .. SetLocationUp

# update & cleanup

function PackageUpdate {
    winget upgrade -r --accept-package-agreements --accept-source-agreements
}
New-Alias package-update PackageUpdate

function UpdateCleanup {
    PackageUpdate
}
New-Alias uc UpdateCleanup
