function Get-Version {

    <#

    .SYNOPSIS
    Returns the version information from Rscript

    .DESCRIPTION
    Executes `Rscript --version` and returns the result.

    .OUTPUTS
    string

    .EXAMPLE
    PS C:\> Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
    PS C:\> $version = Get-RVersion
    R scripting front-end version 3.5.2 (2018-12-20)

    #>

    [CmdletBinding()]
    param ()

    Invoke-RScript '--version' -Timeout $null -ErrorAction 'SilentlyContinue' -WarningAction 'SilentlyContinue' -WarningVariable errorOutput

    Write-Output $errorOutput[0]

}
