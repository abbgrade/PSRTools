function New-Package {

    <#

    .SYNOPSIS
    Builds a R package

    .DESCRIPTION
    Executes the devtools build function.
    Returns the path to the created package archive.

    .PARAMETER Path
    Specifies the path to the package source

    .PARAMETER Library
    Specifies an additional library path that contains required R packages.

    .OUTPUTS
    string

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
        $archivePath = Invoke-RScript -ArgumentList $commands -Timeout $null -ParseOutput | ForEach-Object { $_.Trim('"') }
        if ( Test-Path $archivePath -PathType Leaf ) {
            Write-Verbose "Package $( ( Get-Item $archivePath ).Name ) was created."
        } else {
            throw "Package $( ( Get-Item $Path ).Name ) was not created."
        }
    }
    finally {
        Pop-Location
    }

    return $archivePath
}
