function Set-ScriptPath {

    <#

    .SYNOPSIS
    Set Rscript path

    .DESCRIPTION
    Configures the path to Rscript.exe as preparation for other commands.

    .PARAMETER Path
    Specifies the path to Rscript.exe to be used by other commands.

    .EXAMPLE
    PS C:\> Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
    PS C:\> $version = Get-RVersion
    R scripting front-end version 3.5.2 (2018-12-20)

    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [ValidateScript({ $_.EndsWith('Rscript.exe') })]
        [string] $Path
    )

    Set-Variable -Name RScriptPath -Value $Path -Visibility Public -Scope Script

}
