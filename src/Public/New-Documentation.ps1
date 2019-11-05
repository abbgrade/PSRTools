function New-Documentation {

    <#

    .SYNOPSIS
    Builds a R package documentation

    .DESCRIPTION
    Executes the devtools document function.

    .PARAMETER Path
    Specifies the path to the package source

    .OUTPUTS
    NULL

    .EXAMPLE
    PS C:\> New-RDocumentation ( Get-REscapedString '$PackagePath' )


    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateScript({ Test-Path $_ -PathType Container })]
        [string] $Path
    )

    Push-Location $Path
    try {
        Invoke-RScript 'devtools::document()' -Timeout $null
    }
    finally {
        Pop-Location
    }
}
