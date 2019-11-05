
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Invoke-RCommand' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath
        }
        It 'print hello world' {
            Invoke-RCommand "print('hello world')" | Should -Be 'hello world'
        }
    }
}
