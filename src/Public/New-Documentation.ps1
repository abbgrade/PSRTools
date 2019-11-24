function New-Documentation {

    <#

    .SYNOPSIS
    Builds a R package documentation

    .DESCRIPTION
    Executes the devtools document function.

    .PARAMETER Path
    Specifies the path to the package source

    .PARAMETER Library
    Specifies an additional library path that contains required R packages.

    .OUTPUTS
    NULL

    .EXAMPLE
    PS C:\> New-RDocumentation -Path $PackagePath

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

    $commands += @( 'devtools::document()' )

    Push-Location $Path
    try {
        Invoke-RScript -ArgumentList $commands -Timeout $null | Out-Null
    }
    finally {
        Pop-Location
    }
}
