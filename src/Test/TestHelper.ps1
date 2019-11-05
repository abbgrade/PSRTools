#Requires -Modules Pester

param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } ),
    [string] $ModuleManifestPath = "$PSScriptRoot\..\PSRTools.psd1"
)

Import-Module "$PSScriptRoot\..\PSRTools.psd1" -Force

$RScriptPath = 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
