function New-Package {

    <#

    .SYNOPSIS
    Builds a R package

    .DESCRIPTION
    Executes the devtools build function.

    .PARAMETER Path
    Specifies the path to the package source

    .PARAMETER Library
    Specifies an additional library path that contains required R packages.

    .OUTPUTS
    NULL

    .EXAMPLE
    PS C:\> New-RPackage ( Get-REscapedString '$PackagePath' )


    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateScript({ Test-Path $_ -PathType Container })]
        [string] $Path,

        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string] $Library
    )

    $commands = @()

    if ( $Library ) {
        $commands += @( Get-AddLibraryCommand $Library )
    }

    $commands += @( 'devtools::build()' )

    Push-Location $Path
    try {
        Invoke-RScript -ArgumentList $commands -Timeout $null
    }
    finally {
        Pop-Location
    }
}
