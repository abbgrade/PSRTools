function Get-EscapedPath {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Path
    )

    Write-Output $Path.Replace('\', '\\')
}
