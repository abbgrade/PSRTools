
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Get-Library' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath
        }
        It 'returns libraries' {
            Get-RLibrary | ForEach-Object {
                Test-Path $_ -PathType Container | Should -BeTrue
            }
        }
    }
}
