#Requires -Modules Pester

param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } ),
    [string] $ModuleManifestPath = "$PSScriptRoot\..\PSRTools.psd1"
)

Import-Module "$PSScriptRoot\..\PSRTools.psd1" -Force

$RScriptPath = 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'

function New-TempLibrary {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string]
        $TempDirectory
    )

    return New-Item "$TempDirectory\lib" -ItemType Directory
}

function New-TestProject {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string]
        $TempDirectory,

        [Parameter( Mandatory )]
        [ValidateScript( { Test-Path $_ -PathType Container })]
        [string]
        $Library
    )

    $packagePath = "$TempDirectory\test"
    Invoke-RCommand "usethis::create_package('$( Get-REscapedString $packagePath )')" -Library $Library
    return $packagePath
}
