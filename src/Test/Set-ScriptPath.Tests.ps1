
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Set-RScript' {
    It 'works with a valid path' {
        Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Client\R_SERVER\bin\x64\Rscript.exe'
    }

    It 'fails with a invalid path' {
        {
            Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Client\R_SERVER\bin\x64\R.exe'
        } | Should -Throw
    }

    It 'fails with a directory path' {
        {
            Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Client\R_SERVER\bin'
        } | Should -Throw
    }
}
