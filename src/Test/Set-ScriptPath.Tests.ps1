
param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } )
)

. $PSScriptRoot\TestHelper.ps1

Describe 'Set-RScript' {
    It 'works with a valid path' {
        # eg. C:\Program Files\Microsoft\R Open\R-3.5.3\bin\x64 must be in the PATH environment variable
        Set-RScriptPath -Path ( & where.exe 'Rscript.exe' )
    }

    It 'fails with a invalid path' {
        {
            Set-RScriptPath -Path ( & where.exe 'R.exe' )
        } | Should -Throw
    }

    It 'fails with a directory path' {
        {
            Set-RScriptPath -Path 'C:\Program Files'
        } | Should -Throw
    }
}
