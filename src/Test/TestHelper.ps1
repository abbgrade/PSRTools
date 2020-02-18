#Requires -Modules Pester

param (
    [string] $PSScriptRoot = $( if ( $PSScriptRoot ) { $PSScriptRoot } else { Get-Location } ),
    [string] $ModuleManifestPath = "$PSScriptRoot\..\PSRTools.psd1"
)

Import-Module "$PSScriptRoot\..\PSRTools.psd1" -Force

# Rscript must be available in the PATH environment variable
$RScriptPath = & where.exe Rscript.exe

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

    Install-RPackage -Name 'usethis' -Library $Library

    $packagePath = "$TempDirectory\test"
    Invoke-RCommand "usethis::create_package('$( Get-REscapedString $packagePath )')" -Library $Library | Out-Null
    return Get-Item $packagePath
}

function New-TestPackage {

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

    $project = New-TestProject -TempDirectory $TempDirectory -Library $Library
    Install-RPackage -Name 'devtools' -Library $Library
    $packagePath = New-RPackage -Path $project -Library $Library
    return New-Object PSObject -Property @{
        Name = $project.Name
        Path = $packagePath
    }
}
