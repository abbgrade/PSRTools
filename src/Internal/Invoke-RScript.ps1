function Invoke-RScript {

    <#

    .SYNOPSIS Invokes a RScript command

    .PARAMETER ArgumentList
    Specifies the arguments that are passed to RScript.
    All arguments are casted to string.

    #>

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string[]]
        $ArgumentList,

        [Parameter(Mandatory=$true)]
        [ValidateNotNull()]
        [int]
        $Timeout
    )

    if ( -not $RScriptPath ) {
        Write-Error 'Path to Rscript.exe is not net. Please run Set-RScriptPath.'
    } elseif ( -not ( Test-Path $RScriptPath -PathType Leaf )) {
        Write-Error 'Path to Rscript.exe is invalid. Please re-run Set-RScriptPath.'
    }

    # Configure process
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo.Filename = $RScriptPath
    $process.StartInfo.Arguments = $ArgumentList
    $process.StartInfo.RedirectStandardOutput = $true
    $process.StartInfo.RedirectStandardError = $true
    $process.StartInfo.UseShellExecute = $false
    $process.StartInfo.CreateNoWindow = $true

    # Connect output events
    $standardOutputBuffer = New-Object System.Collections.SortedList
    $standardErrorBuffer = New-Object System.Collections.SortedList

    $EventAction = {
        if ( -not [String]::IsNullOrEmpty( $EventArgs.Data )) {
            $Event.MessageData.Add( $event.EventIdentifier, $EventArgs.Data ) | Out-Null
            Write-Verbose $EventArgs.Data
        }
    }

    $outputEvent = Register-ObjectEvent -InputObject $process `
        -EventName 'OutputDataReceived' -Action $EventAction -MessageData $standardOutputBuffer
    $errorEvent = Register-ObjectEvent -InputObject $process `
        -EventName 'ErrorDataReceived' -Action $EventAction -MessageData $standardErrorBuffer

    try {
        $processCall = "$( $process.StartInfo.FileName ) $( $process.StartInfo.Arguments )"
        if ( $processCall.Length -ge 250 ) { $processCall = "$( $processCall.Substring(252) )..." }
        Write-Verbose "Process started: $processCall"

        $process.Start() | Out-Null
        $process.BeginOutputReadLine()
        $process.BeginErrorReadLine()

        # Wait for exit
        if ( $Timeout ) {
            $process.WaitForExit( $Timeout * 1000 ) | Out-Null
        }
        $process.WaitForExit() | Out-Null # Ensure streams are flushed

        Write-Verbose "Process exited (code $( $process.ExitCode )) after $( $process.TotalProcessorTime )."
    } finally {
        Unregister-Event -SourceIdentifier $outputEvent.Name
        Unregister-Event -SourceIdentifier $errorEvent.Name
    }

    # Process output
    if ( $standardOutputBuffer.Count  ) {
        $standardOutput = $standardOutputBuffer.Values -join "`r`n"
        Write-Verbose "Process output: $standardOutput"
        Write-Output $standardOutput
    } else {
        Write-Verbose 'No process output'
    }

    # process error
    if ( $standardErrorBuffer.Count -or $process.ExitCode ) {
        foreach ( $line in $standardErrorBuffer.Values ) {
            if ( $line ) {
                Write-Warning $line -ErrorAction 'Continue'
            }
        }
        Write-Error "Proccess failed ($processCall) after $( $process.TotalProcessorTime )."
    } else {
        Write-Verbose 'No process error output'
    }
    if ( $Timeout -gt 0 -and $process.TotalProcessorTime.TotalSeconds -ge $Timeout ) {
        Write-Error "Process timed out ($processCall) after $( $process.TotalProcessorTime )."
    }
}
