
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Install-Package' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
        }
        It 'installs logger' {
            Install-RPackage -Name 'logger'
        }
        It 'throws on install wrong package name' {
            {
                Install-RPackage -Name 'wrong-package-name'
            } | Should -Throw
        }
    }
}
