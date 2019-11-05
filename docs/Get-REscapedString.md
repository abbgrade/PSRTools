---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# Get-REscapedString

## SYNOPSIS
Escape a string for R

## SYNTAX

```
Get-REscapedString [-Value] <String> [<CommonParameters>]
```

## DESCRIPTION
Replaces \ characters that are special characters in R for strings.

## EXAMPLES

### BEISPIEL 1
```
Get-REscapedValue 'C:\Windows'
```

C:\\\\Windows

## PARAMETERS

### -Value
The value that should be escaped.

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

### string
## NOTES

## RELATED LINKS
