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
        [string] $Path,

        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string] $Library
    )

    $commands = @()

    if ( $Library ) {
        $commands += @( ".libPaths( c( .libPaths(), '$( Get-EscapedString $Library )' ) )" )
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
