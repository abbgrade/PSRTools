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

### Local
```
Install-RPackage -Path <String> -Name <String> [-Library <String>] [<CommonParameters>]
```

### Repository
```
Install-RPackage -Name <String> [-Library <String>] [-Repository <String>] [-Snapshot <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Installs a package from a specific repository and into a library and checks the success.

## EXAMPLES

### BEISPIEL 1
```
Install-RPackage 'devtools'.
```

### BEISPIEL 2
```
Install-RPackage '.\devtools.tar.gz'.
```

## PARAMETERS

### -Path
Specifies the local path of the package archive.

```yaml
Type: String
Parameter Sets: Local
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Specifies the name of the package.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Library
Specifies the destination directory of the package.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Repository
Specifies the URL of the repository.

```yaml
Type: String
Parameter Sets: Repository
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Snapshot
Specifies a snapshot directory of the repository.

```yaml
Type: String
Parameter Sets: Repository
Aliases:

Required: False
Position: Named
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
