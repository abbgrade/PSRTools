
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'New-Package' {
    Context 'Configured RScript' {
        BeforeAll {
            Set-RScriptPath -Path $RScriptPath

            $tempDirectory = ( Get-Item 'TestDrive:\' ).FullName

            Install-RPackage -Name 'usethis'
            Install-RPackage -Name 'devtools'

            $packgeName = 'test'
            $packagePath = "$tempDirectory\$packgeName"
            Invoke-RCommand "usethis::create_package('$( Get-REscapedPath $packagePath )')"

        }
        It 'builds package' {
            New-RPackage -Path $packagePath
        }
    }
}
