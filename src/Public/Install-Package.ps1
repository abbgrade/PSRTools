Register-ArgumentCompleter -CommandName Install-RPackage -ParameterName Repository -ScriptBlock $RepositoryCompleter
Register-ArgumentCompleter -CommandName Install-RPackage -ParameterName Library -ScriptBlock $LibraryCompleter

function Install-Package {

    <#

    .SYNOPSIS
    Installs a R package

    .DESCRIPTION
    Installs a package from a specific repository and into a library and checks the success.

    .PARAMETER Name
    Specifies the name of the package

    .PARAMETER Library
    Specifies the destination directory of the package

    .PARAMETER Repository
    Specifies the URL of the repository

    .PARAMETER Snapshot
    Specifies a snapshot directory of the repository

    .OUTPUTS
    NULL

    .EXAMPLE
    PS C:\> Install-RPackage 'devtools'

    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string]
        $Library,

        [ValidateNotNullOrEmpty()]
        [string]
        $Repository,

        [ValidateNotNullOrEmpty()]
        [string]
        $Snapshot
    )

    $parameter = @( "'$Name'" )

    if ( $Library ) {
        $parameter += @( "lib='$( Get-REscapedString $Library )'" )
    }

    if ( $Repository ) {
        if ( $Snapshot ) {
            $Repository = "$Repository/snapshot/$Snapshot"
        }
        $parameter += @( "repos='$Repository'" )
    }

    Invoke-RScript "install.packages( $( $parameter -join ', ' ) )", "library( '$Name' )" -Timeout $null -WarningAction 'SilentlyContinue' -ErrorAction 'Stop'

}
