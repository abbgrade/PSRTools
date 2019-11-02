function Install-Package {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [ValidateNotNullOrEmpty()]
        [string]
        $Library,

        [ValidateNotNullOrEmpty()]
        [string]
        $Repository
    )

    $parameter = @( "'$Name'" )

    if ( $Library ) {
        $parameter.Add( "lib='$Library'" )
    }

    if ( $Repository ) {
        $parameter.Add( "repos='$Repository'" )
    }

    Invoke-RScript """install.packages( $( $parameter -join ', ' ) )""", """library( '$Name' )""" -Timeout $null -WarningAction 'SilentlyContinue' -ErrorAction 'Stop'

}
