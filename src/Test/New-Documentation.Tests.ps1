
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'New-Documentation' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath
            $tempDirectory = ( Get-Item 'TestDrive:\' ).FullName
            $libPath = New-TempLibrary -TempDirectory $tempDirectory
            $project = New-TestProject -TempDirectory $tempDirectory -Library $libPath

            Install-RPackage -Name 'devtools' -Library $libPath
            Install-RPackage -Name 'roxygen2' -Library $libPath
        }
        It 'builds docs' {
            New-RDocumentation -Path $project -Library $libPath
        }
    }
}
