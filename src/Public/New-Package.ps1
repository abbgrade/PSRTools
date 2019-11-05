function New-Package {

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
