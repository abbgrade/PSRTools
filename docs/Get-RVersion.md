---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# Get-RVersion

## SYNOPSIS
Returns the version information from Rscript

## SYNTAX

```
Get-RVersion [<CommonParameters>]
```

## DESCRIPTION
Executes \`Rscript --version\` and returns the result.

## EXAMPLES

### BEISPIEL 1
```
Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
```

PS C:\\\> $version = Get-RVersion
R scripting front-end version 3.5.2 (2018-12-20)

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES

## RELATED LINKS
