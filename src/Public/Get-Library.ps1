function Get-Library {

    <#

    .SYNOPSIS
    Get the configured lib paths

    .DESCRIPTION
    Executes `.libPaths()` and returns the result.

    .OUTPUTS
    string[]

    .EXAMPLE
    PS C:\> Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
    PS C:\> Get-RLibrary
    C:/Users/USER/Documents/R/win-library/3.5
    C:/Program Files/Microsoft/R Open/R-3.5.2/library

    #>

    [CmdletBinding()]
    param ()

    Invoke-RScript '.libPaths()' -Timeout $null -ParseOutput | ForEach-Object { $_.Trim('"') }

}
