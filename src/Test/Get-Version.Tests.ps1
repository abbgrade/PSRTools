
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Get-Version' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Client\R_SERVER\bin\x64\Rscript.exe'
        }
        It 'returns the version' {
            Get-RVersion | Should -BeLike '* version *'
        }
    }
}
