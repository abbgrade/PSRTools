---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# Get-RLibrary

## SYNOPSIS
Get the configured lib paths

## SYNTAX

```
Get-RLibrary [<CommonParameters>]
```

## DESCRIPTION
Executes \`.libPaths()\` and returns the result.

## EXAMPLES

### BEISPIEL 1
```
Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
```

PS C:\\\> Get-RLibrary
C:/Users/USER/Documents/R/win-library/3.5
C:/Program Files/Microsoft/R Open/R-3.5.2/library

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string[]
## NOTES

## RELATED LINKS
