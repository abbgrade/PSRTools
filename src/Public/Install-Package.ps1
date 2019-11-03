Register-ArgumentCompleter -CommandName Install-RPackage -ParameterName Repository -ScriptBlock $RepositoryCompleter
Register-ArgumentCompleter -CommandName Install-RPackage -ParameterName Library -ScriptBlock $LibraryCompleter

function Install-Package {

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
        $parameter += @( "lib='$( $Library.Replace('\', '\\') )'" )
    }

    if ( $Repository ) {
        if ( $Snapshot ) {
            $Repository = "$Repository/snapshot/$Snapshot"
        }
        $parameter += @( "repos='$Repository'" )
    }

    Invoke-RScript """install.packages( $( $parameter -join ', ' ) )""", """library( '$Name' )""" -Timeout $null -WarningAction 'SilentlyContinue' -ErrorAction 'Stop'

}
