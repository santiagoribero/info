$loc = (Get-Item -Path ".\").FullName

#Run ETRM services
invoke-expression "cmd /c start powershell -Command { $loc\Bin\EFM.ServerApplication.exe }"

ECHO 'Press ENTER once ETRM is running'
PAUSE

Start-Service -Name "Elviz File Watching Service" #Viz.Integration.Core.FileWatcher.exe
Start-Service -Name "Elviz Message Queue Listener Service" #Viz.Integration.Core.MessageQueueListener.exe
Start-Service -Name "Elviz WCF Publishing Service" #Viz.Integration.Core.WCFPublisher.exe