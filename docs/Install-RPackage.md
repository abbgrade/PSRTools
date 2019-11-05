---
external help file: PSRTools-help.xml
Module Name: PSRTools
online version:
schema: 2.0.0
---

# Install-RPackage

## SYNOPSIS
Installs a R package

## SYNTAX

```
Install-RPackage [-Name] <String> [[-Library] <String>] [[-Repository] <String>] [[-Snapshot] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Installs a package from a specific repository and into a library and checks the success.

## EXAMPLES

### BEISPIEL 1
```
Install-RPackage 'devtools'
```

## PARAMETERS

### -Name
Specifies the name of the package

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
Specifies the destination directory of the package

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

### -Repository
Specifies the URL of the repository

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Snapshot
Specifies a snapshot directory of the repository

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
