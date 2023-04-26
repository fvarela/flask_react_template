$CurrentScriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$wtArguments = "-w 0 -d `"$CurrentScriptPath`" ; new-tab -d `"$CurrentScriptPath`""
Start-Process wt.exe -ArgumentList $wtArguments