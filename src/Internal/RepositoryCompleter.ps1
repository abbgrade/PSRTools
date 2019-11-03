$RepositoryCompleter = {
    param (
        $commandName,
        $parameterName,
        $wordToComplete,
        $commandAst,
        $fakeBoundParameters
    )

    return @(
        'https://mran.microsoft.com/',
        'https://cran.r-project.org/'
    )
}

Set-Variable -Name RepositoryCompleter -Value $RepositoryCompleter -Visibility Public -Scope Script
