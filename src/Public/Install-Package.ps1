Register-ArgumentCompleter -CommandName Install-RPackage -ParameterName Repository -ScriptBlock $RepositoryCompleter
Register-ArgumentCompleter -CommandName Install-RPackage -ParameterName Library -ScriptBlock $LibraryCompleter

function Install-Package {

    <#

    .SYNOPSIS
    Installs a R package

    .DESCRIPTION
    Installs a package from a specific repository and into a library and checks the success.

    .PARAMETER Path
    Specifies the local path of the package archive.

    .PARAMETER Name
    Specifies the name of the package.

    .PARAMETER Library
    Specifies the destination directory of the package.

    .PARAMETER Repository
    Specifies the URL of the repository.

    .PARAMETER Snapshot
    Specifies a snapshot directory of the repository.

    .OUTPUTS
    NULL

    .EXAMPLE
    PS C:\> Install-RPackage 'devtools'.

    .EXAMPLE
    PS C:\> Install-RPackage '.\devtools.tar.gz'.

    #>

    [CmdletBinding()]
    param (
        [Parameter( ParameterSetName='Local' )]
        [ValidateScript({ Test-Path $_ -PathType Leaf })]
        [string]
        $Path,

        [Parameter( Mandatory, ParameterSetName='Repository' )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter( ParameterSetName='Repository' )]
        [Parameter( ParameterSetName='Local' )]
        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string]
        $Library,

        [Parameter( ParameterSetName='Repository' )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Repository,

        [Parameter( ParameterSetName='Repository' )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Snapshot
    )

    $commands = @()

    switch ( $PSCmdlet.ParameterSetName ) {
        Repository {
            $parameter = @( "'$Name'" )
        }
    }

    if ( $Library ) {
        $parameter += @( "lib='$( Get-REscapedString $Library )'" )
        $commands += @( Get-AddLibraryCommand $Library )
    }

    switch ( $PSCmdlet.ParameterSetName ) {
        Repository {
            if ( $Repository ) {
                if ( $Snapshot ) {
                    $Repository = "$Repository/snapshot/$Snapshot"
                }
                $parameter += @( "repos='$Repository'" )
            }
        }
    }

    $commands += "install.packages( $( $parameter -join ', ' ) )"
    $commands += "library( '$Name' )"

    Invoke-RScript $commands -Timeout $null -WarningAction 'SilentlyContinue' -ErrorAction 'Stop'

}
