# PSRTools

This PowerShell Modules helps to integrate R into DevOps processes for continuous integration and continuous deployment.

[![Build status](https://ci.appveyor.com/api/projects/status/wprgefs7vsaug8sv?svg=true)](https://ci.appveyor.com/project/abbgrade/psrtools)

## Installation

Install PSDocker from [PowerShell Gallery](https://www.powershellgallery.com/packages/psrtools) using a PowerShell command line:

    Install-Module -Name PSRTools -Scope CurrentUser

## Build

This project uses a [build script](./PSRTools.build.ps1) that is based on [Invoke-Build](https://github.com/nightroman/Invoke-Build).
For installation details see the instructions from the Invoke-Build project, but we recommend `Install-Module InvokeBuild -Scope CurrentUser`.
The documentation is based on [platyPS](https://github.com/PowerShell/platyPS), so you may want to execute `Install-Module PlatyPs -Scope CurrentUser`.

You can run the build by:

- __PowerShell__: execute `Invoke-Build` in a PowerShell in the directory of this project
- __VSCode__: run the integrated build task feature (F1 + "Tasks: Run Build Task")

## Test

This project uses test scripts using [Pester](https://github.com/pester/Pester).
For installation details see the instructions from the Pester project, but we recommend `Install-Module Pester -Scope CurrentUser`.
The tests depend on the default installation of Microsoft R Open and RTools, that can be installed by `choco install microsoft-r-open` and `choco install rtools`.

You can run the tests by:

- __PowerShell__: execute `Invoke-Build Test` in a PowerShell in the directory of this project
- __VSCode__: run the integrated test task feature (F1 + "Tasks: Run Test Task")

For debugging tests change the working directory to ./src/test create the breakpoint in VSCode and start debugging by F1 + "Debug: Start Debugging".

## Usage

See the folder [docs](./docs) for examples.

## Changelog

### Version 0.2.0

- New functions New-RPackage, Invoke-RCommand and Get-REscapedString

### Version 0.1.0

- New functions Install-RPackage, Get-RLibrary and Get-RVersion
