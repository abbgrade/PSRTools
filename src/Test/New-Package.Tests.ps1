
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'New-Package' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath

            $tempDirectory = ( Get-Item 'TestDrive:\' ).FullName

            $libPath = "$tempDirectory\lib"
            New-Item $libPath -ItemType Directory
            Install-RPackage -Name 'usethis' -Library $libPath
            Install-RPackage -Name 'devtools' -Library $libPath

            $packagePath = "$tempDirectory\test"
            Invoke-RCommand "usethis::create_package('$( Get-REscapedString $packagePath )')" -Library $libPath
        }
        It 'builds package' {
            New-RPackage -Path $packagePath -Library $libPath
        }
    }
}
