---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# New-RPackage

## SYNOPSIS
Builds a R package

## SYNTAX

```
New-RPackage [-Path] <String> [[-Library] <String>] [<CommonParameters>]
```

## DESCRIPTION
Executes the devtools build function.
Returns the path to the created package archive.

## EXAMPLES

### BEISPIEL 1
```
New-RPackage -Path '$PackagePath'
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

### string
## NOTES

## RELATED LINKS
