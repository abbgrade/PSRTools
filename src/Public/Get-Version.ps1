function Get-Version {
    [CmdletBinding()]
    param ()

    Invoke-RScript '--version' -Timeout $null -ErrorAction 'SilentlyContinue' -WarningAction 'SilentlyContinue' -WarningVariable errorOutput

    Write-Output $errorOutput[0]

}
