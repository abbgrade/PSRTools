function Get-AddLibraryCommand {
    param(
        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string] $Library
    )

    Write-Output ".libPaths( c( .libPaths(), '$( Get-EscapedString $Library )' ) )"
}
