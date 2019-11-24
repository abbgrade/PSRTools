---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# New-RDocumentation

## SYNOPSIS
Builds a R package documentation

## SYNTAX

```
New-RDocumentation [-Path] <String> [[-Library] <String>] [<CommonParameters>]
```

## DESCRIPTION
Executes the devtools document function.

## EXAMPLES

### BEISPIEL 1
```
New-RDocumentation -Path $PackagePath
```

## PARAMETERS

### -Path
Specifies the path to the package source

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

### -Library
Specifies an additional library path that contains required R packages.

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

### NULL
## NOTES

## RELATED LINKS
