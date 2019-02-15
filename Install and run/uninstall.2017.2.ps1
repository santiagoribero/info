$loc = (Get-Item -Path ".\").FullName

# Stop login manager
Stop-process -name 'ElvizLM'

# Stop services
Stop-Service -Name "Elviz File Watching Service" #Viz.Integration.Core.FileWatcher.exe
Stop-Service -Name "Elviz Message Queue Listener Service" #Viz.Integration.Core.MessageQueueListener.exe
Stop-Service -Name "Elviz WCF Publishing Service" #Viz.Integration.Core.WCFPublisher.exe

# Uninstall services
cmd /c $loc\Integration\Viz.Integration.Core.WCFPublisher\UnInstallElvizWCFPublishingService.cmd
cmd /c $loc\Integration\Viz.Integration.Core.MessageQueueListener\UnInstallMQListener.cmd
cmd /c $loc\Integration\Viz.Integration.Core.FileWatcher\UnInstallFileWatcher.cmd


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

# Emake cz
cmd /c $loc\Source\emake cz

#delete
#RMDIR /s /q $loc