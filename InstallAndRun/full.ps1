 # .\full.ps1 -ticket ELVIZ-12280-orig -version 2019.2 -download -upgrade -removeLicense -install -run -installServices -startServices
 # .\full.ps1 -ticket CC-508 -version 2019.1 -download -upgrade -project "etrm-contractclearer"

 param (
    [Parameter(Mandatory=$true)][string]$ticket,
    [Parameter(Mandatory=$true)][string]$version,
    [switch]$download,
    [switch]$upgrade,
    [switch]$removeLicense,
    [switch]$buildScenarioManager,
    [switch]$install,
    [switch]$run,
    [switch]$installServices,
    [switch]$startServices,
    [switch]$uninstall,
    [string]$project = "etrm"
 )

###### Validation of running as Admin
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Host "Script not being run as Administrator. Please re-run it as admin." -ForegroundColor red -BackgroundColor black
    Exit
}

$originalLocation = Get-Location
try
{
	
	$rootPath = "c:\git\"
	$gituser = "santiagoribero"

	$forkBranch = "$($ticket)-$($version)"
	$bradyBranch = $version
	if ($project -eq "etrm")
	{
		if ($bradyBranch -eq "2019.3") {
			$bradyBranch = "master"
		}
	}
	else {
		if (($project -eq "etrm-contractclearer") -or ($project -eq "etrm-clearingreportsviewer")) {
			if ($bradyBranch -eq "2019.1") {
				$bradyBranch = "master"
			}
		}
	}

	$targetdir = "$($rootPath)$($forkBranch)"

	if ($run -OR $install -OR $uninstall) {
		Write-Host "`nSetting up Visual Studio 2017 Command Prompt variables..." -ForegroundColor Green
		pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools"
		cmd /c "VsDevCmd.bat&set" |
		foreach {
		  if ($_ -match "=") {
		    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
		  }
		}
		popd
		Write-Host "`nVisual Studio 2017 Command Prompt variables set." -ForegroundColor Green
	}


	if ($download) {

		if(!(Test-Path -Path $targetdir )){
			Write-Host "`nCreating $($targetdir) folder..." -ForegroundColor Green
		    New-Item -ItemType directory -Path $targetdir

			cd $targetdir
			$repositoryURL = "https://github.com/$($gituser)/$($project)"

			Write-Host "`nCloning $($repositoryURL) $($bradyBranch) branch..." -ForegroundColor Green
			git clone $repositoryURL -b $bradyBranch
			cd "$($project)"

			Write-Host "`nSetting up upstream branch..." -ForegroundColor Green
			git remote add upstream "https://github.com/bradyplc/$($project)"
			git remote set-url --push upstream no_push

			Write-Host "`nCreating local branch $($forkBranch)..." -ForegroundColor Green
			git checkout -b $forkBranch
		}
		else {
			throw "Folder $($targetdir) already exists"
		}
	}

	if ($upgrade) {
		cd $targetdir
		cd "$($project)"
		Write-Host "`nUpgrading local copy with upstream code..." -ForegroundColor Green
		git fetch upstream
		git reset --hard "upstream/$($bradyBranch)"
	}

	if ($uninstall -or $install) {
		if(Test-Path -Path $targetdir ){
			Write-Host "`nUninstalling $($targetdir)..." -ForegroundColor Green

			# Stop login manager
			$ElvizLM = Get-Process ElvizLM -ErrorAction SilentlyContinue
			if ($ElvizLM) {
			  $ElvizLM | Stop-Process -Force
			}
			Remove-Variable ElvizLM

			# Stop services
			Stop-Service -Name "Elviz File Watching Service" #Viz.Integration.Core.FileWatcher.exe
			Stop-Service -Name "Elviz Message Queue Listener Service" #Viz.Integration.Core.MessageQueueListener.exe
			Stop-Service -Name "Elviz WCF Publishing Service" #Viz.Integration.Core.WCFPublisher.exe

			# Uninstall services
			Write-Host "`nUninstalling $($targetdir) windows services..." -ForegroundColor Green
			cmd /c "$($targetdir)\etrm\Integration\UnInstallElvizWCFPublishingService.cmd"
			cmd /c "$($targetdir)\etrm\Integration\UnInstallMQListener.cmd"
			cmd /c "$($targetdir)\etrm\Integration\UnInstallFileWatcher.cmd"
			Write-Host "`nUninstalling $($targetdir) ETRM server..." -ForegroundColor Green
			$env:CD = "$($targetdir)\etrm\"
			cmd /c "$($targetdir)\etrm\Source\emake" cz
		}
		else {
			throw "Folder $($targetdir) does not exist"
		}
	}

	if(Test-Path -Path $targetdir ){
		if ($project -eq "etrm")
		{
			if ($removeLicense) {
				Write-Host "`nRemoving licenses..." -ForegroundColor Green
				Get-ChildItem -Path "$($targetdir)\etrm\Source" -Filter licenses.licx -Recurse -ErrorAction SilentlyContinue -Force | ForEach-Object {
				    $content = Get-Content $_.FullName | Where-Object {$_ -NotMatch 'Janus'}
				    $content | Out-File $_.FullName
				}
			}

			if (!($buildScenarioManager)) {
				Write-Host "`nCommenting out the Build Scenario Manager build..." -ForegroundColor Green
				((Get-Content -path "$($targetdir)\etrm\Scripts\CommonBuildScripts\BuildAll.bat" -Raw) -replace 'call "%~dp0\\buildSM.bat"','REM call "%~dp0\buildSM.bat"') | Set-Content -Path "$($targetdir)\etrm\Scripts\CommonBuildScripts\BuildAll.bat"
				((Get-Content -path "$($targetdir)\etrm\Scripts\CommonBuildScripts\BuildAll.bat" -Raw) -replace 'if %errorlevel% NEQ 0 exit /B 200','REM if %errorlevel% NEQ 0 exit /B 200') | Set-Content -Path "$($targetdir)\etrm\Scripts\CommonBuildScripts\BuildAll.bat"
			}


			if ($install) {
				Write-Host "`nInstalling ETRM..." -ForegroundColor Green
				# Emake
				cmd /c "$($targetdir)\etrm\Source\emake" d y
				cmd /c "$($targetdir)\etrm\Source\emake" vb6
			}


			if ($installServices) {
				# Install services
				cd "$($targetdir)\etrm\Integration"
				.\InstallElvizWCFPublishingService.cmd
				.\InstallMQListener.cmd
				.\InstallFileWatcher.cmd
			}

			if ($run) {
				Write-Host "`nRunning ETRM Server..." -ForegroundColor Green
				$env:CD = "$($targetdir)\etrm\bin"
				if ($startServices) {
					invoke-expression "cmd /c start powershell -Command { $($targetdir)\etrm\Source\emake ls }"

					Write-Host "`nStarting windows services..." -ForegroundColor Green
					Write-Host "`nPlease press Enter once ETRM Service initialization has finished in the other console..." -ForegroundColor Yellow
					pause
					Start-Service -Name "Elviz File Watching Service" #Viz.Integration.Core.FileWatcher.exe
					Start-Service -Name "Elviz Message Queue Listener Service" #Viz.Integration.Core.MessageQueueListener.exe
					Start-Service -Name "Elviz WCF Publishing Service" #Viz.Integration.Core.WCFPublisher.exe
				}
				else {
					cmd /c "$($targetdir)\etrm\Source\emake" ls
				}
			}
		}
	}
	else {
		throw "Folder $($targetdir) does not exist"
	}
}
finally
{
	cd $originalLocation
}
