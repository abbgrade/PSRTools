
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
            $project = New-TestProject -TempDirectory $tempDirectory -Library $libPath

            Install-RPackage -Name 'devtools' -Library $libPath
        }

        It 'throws on build without devtools' {
            {
                New-RPackage -Path $project
            } | Should -Throw
        }

        It 'builds package' {
            New-RPackage -Path $project -Library $libPath
        }
    }
}
