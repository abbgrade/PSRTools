function Invoke-Command {

    <#

    .SYNOPSIS
    Executes a R command

    .DESCRIPTION
    Executes Rscript.exe and returns the output.

    .PARAMETER Command
    Specifies the R command to be executes.

    .OUTPUTS
    string[]

    .EXAMPLE
    PS C:\> Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
    PS C:\> Invoke-RCommand 'hello world'
    hello world

    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string[]] $Command,

        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string] $Library
    )


    $commands = @()

    if ( $Library ) {
        $commands += @( Get-AddLibraryCommand $Library )
    }

    $commands += $Command

    Invoke-RScript $commands -Timeout $null -ParseOutput | ForEach-Object { $_.Trim('"') }
}
