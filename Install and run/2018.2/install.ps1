$loc = (Get-Item -Path ".\").FullName

# Comment "ScenarioManager"
((Get-Content -path "$loc\Scripts\CommonBuildScripts\BuildAll.bat" -Raw) -replace 'call "%~dp0\\buildSM.bat"','REM call "%~dp0\buildSM.bat"') | Set-Content -Path "$loc\Scripts\CommonBuildScripts\BuildAll.bat"
((Get-Content -path "$loc\Scripts\CommonBuildScripts\BuildAll.bat" -Raw) -replace 'if %errorlevel% NEQ 0 exit /B 200','REM if %errorlevel% NEQ 0 exit /B 200') | Set-Content -Path "$loc\Scripts\CommonBuildScripts\BuildAll.bat"

#set VS2017 variables
pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
cmd /c "VsDevCmd.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd
Write-Host "`nVisual Studio 2017 Command Prompt variables set." -ForegroundColor Yellow

# Emake
cmd /c $loc\Source\emake d y
cmd /c $loc\Source\emake vb6

#Run ETRM services
invoke-expression "cmd /c start powershell -Command { $loc\Bin\EFM.ServerApplication.exe }"
