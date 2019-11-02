function Get-Library {

    [CmdletBinding()]
    param ()

    Invoke-RScript '.libPaths()' -Timeout $null -ParseOutput | ForEach-Object { $_.Trim('"') }

}
