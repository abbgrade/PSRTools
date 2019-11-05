function New-Package {

    <#

    .SYNOPSIS
    Builds a R package

    .DESCRIPTION
    Executes the devtools build function.

    .PARAMETER Path
    Specifies the path to the package source

    .OUTPUTS
    NULL

    .EXAMPLE
    PS C:\> New-RPackage ( Get-REscapedString '$PackagePath' )


    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateScript({ Test-Path $_ -PathType Container })]
        [string] $Path
    )

    Push-Location $Path
    try {
        Invoke-RScript 'devtools::build()' -Timeout $null
    }
    finally {
        Pop-Location
    }
}
