
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Install-Package' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath
            $tempDirectory = ( Get-Item 'TestDrive:\' ).FullName
            $libPath = New-TempLibrary -TempDirectory $tempDirectory
            $testPackage = New-TestPackage -TempDirectory $tempDirectory -Library $libPath
        }
        It 'installs logger' {
            Install-RPackage -Name 'logger' -Library $libPath
        }
        It 'installs from specified repository' {
            Install-RPackage -Name 'logger' -Repository 'https://mran.microsoft.com/' -Library $libPath
        }
        It 'throws on install wrong package name' {
            {
                Install-RPackage -Name 'wrong-package-name' -Library $libPath
            } | Should -Throw
        }
        It 'installs from local package' {
            Install-RPackage -Path $testPackage.Path -Name $testPackage.Name -Library $libPath
        }
    }
}
