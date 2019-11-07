
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'New-Package' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath

            $tempDirectory = ( Get-Item 'TestDrive:\' ).FullName

            $libPath = New-TempLibrary -TempDirectory $tempDirectory

            Install-RPackage -Name 'usethis' -Library $libPath
            Install-RPackage -Name 'devtools' -Library $libPath

            $packagePath = New-TestProject -TempDirectory $tempDirectory -Library $libPath
        }

        It 'builds package without devtools' {
            {
                New-RPackage -Path $packagePath
            } | Should -Throw
        }

        It 'builds package' {
            New-RPackage -Path $packagePath -Library $libPath
        }
    }
}
