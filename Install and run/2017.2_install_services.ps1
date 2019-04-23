$loc = (Get-Item -Path ".\").FullName

# Install services
cd $loc\Integration\Viz.Integration.Core.WCFPublisher
.\InstallElvizWCFPublishingService.cmd
cd $loc\Integration\Viz.Integration.Core.MessageQueueListener
.\InstallMQListener.cmd
cd $loc\Integration\Viz.Integration.Core.FileWatcher
.\InstallFileWatcher.cmd
ECHO 'Press ENTER once ETRM is running'
PAUSE

Start-Service -Name "Elviz File Watching Service" #Viz.Integration.Core.FileWatcher.exe
Start-Service -Name "Elviz Message Queue Listener Service" #Viz.Integration.Core.MessageQueueListener.exe
Start-Service -Name "Elviz WCF Publishing Service" #Viz.Integration.Core.WCFPublisher.exe