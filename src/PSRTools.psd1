@{
    RootModule = 'PSRTools.psm1'
    ModuleVersion = '0.0.1'
    GUID = '47a50190-7e53-4f21-94d6-9b3ea97718c9'
    Author = 'Steffen Kampmann'
    Copyright = '(c) 2019 s.kampmann. Alle Rechte vorbehalten.'
    Description = 'PowerShell Cmdlets that wrap RScript to support admin tasks.'
    FunctionsToExport = '*'
    CmdletsToExport = '*'
    VariablesToExport = '*'
    AliasesToExport = '*'
    PrivateData = @{
        PSData = @{
            Tags = @('R')
            LicenseUri = 'https://github.com/abbgrade/PSRTools/blob/master/LICENSE'
            ProjectUri = 'https://github.com/abbgrade/PSRTools'
        }
    }
    DefaultCommandPrefix = 'R'
}
