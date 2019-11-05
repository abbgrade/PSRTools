function Get-EscapedString {

    <#

    .SYNOPSIS
    Escape a string for R

    .DESCRIPTION
    Replaces \ characters that are special characters in R for strings.

    .PARAMETER Value
    The value that should be escaped.

    .OUTPUTS
    string

    .EXAMPLE
    PS C:\> Get-REscapedValue 'C:\Windows'
    C:\\Windows

    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Value
    )

    Write-Output $Value.Replace('\', '\\')
}
