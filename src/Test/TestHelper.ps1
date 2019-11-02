#Requires -Modules Pester

param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } ),
    [string] $ModuleManifestPath = "$PSScriptRoot\..\PSRTools.psd1"
)

Import-Module "$PSScriptRoot\..\PSRTools.psd1" -Force
