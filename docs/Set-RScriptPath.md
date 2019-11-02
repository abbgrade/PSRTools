---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# Set-RScriptPath

## SYNOPSIS
Set Rscript path

## SYNTAX

```
Set-RScriptPath [-Path] <String> [<CommonParameters>]
```

## DESCRIPTION
Configures the path to Rscript.exe as preparation for other commands.

## EXAMPLES

### BEISPIEL 1
```
Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
```

PS C:\\\> $version = Get-RVersion
R scripting front-end version 3.5.2 (2018-12-20)

## PARAMETERS

### -Path
Specifies the path to Rscript.exe to be used by other commands.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
