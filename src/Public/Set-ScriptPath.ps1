function Set-ScriptPath {
    param (
        [Parameter( Mandatory )]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [ValidateScript({ $_.EndsWith('Rscript.exe') })]
        [string] $Path
    )

    Set-Variable -Name RScriptPath -Value $Path -Visibility Public -Scope Script

}
