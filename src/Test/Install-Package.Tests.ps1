
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Install-Package' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath
        }
        It 'installs logger' {
            Install-RPackage -Name 'logger'
        }
        It 'installs from specified repository' {
            Install-RPackage -Name 'logger' -Repository 'https://mran.microsoft.com/'
        }
        It 'throws on install wrong package name' {
            {
                Install-RPackage -Name 'wrong-package-name'
            } | Should -Throw
        }
        It 'installs from local package' {
            Install-RPackage -Path 'test.tar.gz'
        }
    }
}
