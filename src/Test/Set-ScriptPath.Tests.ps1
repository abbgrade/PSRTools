
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Set-RScript' {
    It 'works with a valid path' {
        Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
    }

    It 'fails with a invalid path' {
        {
            Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\R.exe'
        } | Should -Throw
    }

    It 'fails with a directory path' {
        {
            Set-RScriptPath -Path 'C:\Program Files'
        } | Should -Throw
    }
}
