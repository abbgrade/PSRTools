# PSRTools

## Build

This project uses a [build script](./PSRTools.build.ps1) that is based on [Invoke-Build](https://github.com/nightroman/Invoke-Build).
For installation details see the instructions from the Invoke-Build project, but we recommend `Install-Module InvokeBuild -Scope CurrentUser`.

You can run the build by:

- __PowerShell__: execute `Invoke-Build` in a PowerShell in the directory of this project
- __VSCode__: run the integrated build task feature (F1 + "Tasks: Run Build Task")

## Test

This project uses test scripts using [Pester](https://github.com/pester/Pester).
For installation details see the instructions from the Pester project, but we recommend `Install-Module Pester -Scope CurrentUser`.

You can run the tests by:

- __PowerShell__: execute `Invoke-Build Test` in a PowerShell in the directory of this project
- __VSCode__: run the integrated test task feature (F1 + "Tasks: Run Test Task")

For debugging tests change the working directory to ./src/test create the breakpoint in VSCode and start debugging by F1 + "Debug: Start Debugging".

## Usage

See the folder [docs](./docs) for examples.
