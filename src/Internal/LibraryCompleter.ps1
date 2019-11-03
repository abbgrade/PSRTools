$LibraryCompleter = {
    param (
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters
    )

    return Get-RLibrary | Select-Object -Unique
}

Set-Variable -Name LibraryCompleter -Value $LibraryCompleter -Visibility Public -Scope Script
