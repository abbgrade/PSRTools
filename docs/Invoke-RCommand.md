---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# Invoke-RCommand

## SYNOPSIS
Executes a R command

## SYNTAX

```
Invoke-RCommand [-Command] <String[]> [[-Library] <String>] [<CommonParameters>]
```

## DESCRIPTION
Executes Rscript.exe and returns the output.

## EXAMPLES

### BEISPIEL 1
```
Set-RScriptPath -Path 'C:\Program Files\Microsoft\R Open\R-3.5.2\bin\x64\Rscript.exe'
```

PS C:\\\> Invoke-RCommand 'hello world'
hello world

## PARAMETERS

### -Command
Specifies the R command to be executes.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Library
Specifies if a additinal package library should be included.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string[]
## NOTES

## RELATED LINKS
