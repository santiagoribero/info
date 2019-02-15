param (
    [string]$inputFilePath
)


################################################################
### FUNCTIONS ##################################################
################################################################

### Function to ask for confirmation
function Get-Confirmation {
  $question = 'Do you want to proceed?'
  $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
  $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
  $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
  $decision = $Host.UI.PromptForChoice("", $question, $choices, 1)
  return $decision
}


################################################################
### VALIDATIONS ################################################
################################################################

###### Validation of running as Admin
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(!$currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Host "Script not being run as Administrator. Please re-run it as admin." -ForegroundColor red -BackgroundColor black
    Exit
}

###### Validation of input file specified
if ([string]::IsNullOrEmpty($inputFilePath))
{
    $inputFilePath = "$($PSScriptRoot)\input.XML"
    Write-Host "-inputFilePath not specified." -ForegroundColor red -BackgroundColor black
    if([System.IO.File]::Exists($inputFilePath)){
        Write-Host "Using '$($inputFilePath)' as input file." -ForegroundColor red -BackgroundColor black
    }
    else {
        $inputFilePath = $( Read-Host "Enter Path of input file" )
    }
}

if ([string]::IsNullOrEmpty($inputFilePath))
{
    Write-Host "-inputFilePath not specified." -ForegroundColor red -BackgroundColor black
    Exit
}

###### Validation of existing input file
if(![System.IO.File]::Exists($inputFilePath)){
    Write-Host "Input file '$inputFilePath' not found." -ForegroundColor red -BackgroundColor black
    Exit
}


################################################################
### INITIALIZATIONS ############################################
################################################################

$rootFolder = $PSScriptRoot

Write-Host Environment set up -ForegroundColor red -BackgroundColor white
Write-Host "The path used to download or execute the installers will be '$PSScriptRoot'. You can proceed to change this path." -ForegroundColor darkred -BackgroundColor white
$r = Get-Confirmation
if ($r -eq 0) {
  $rootFolder = Read-Host -Prompt 'Enter the path for the files (eg: C:\EnvironmentSetting)'
   Write-Host "Will download to $rootFolder" -ForegroundColor darkred -BackgroundColor white
   Read-Host -Prompt "Press Enter to continue"
}

[xml]$xmlContent = (Get-Content $inputFilePath)
[System.Xml.XmlElement] $root = $xmlContent.get_DocumentElement()
[System.Xml.XmlElement] $step = $null
[System.Xml.XmlElement] $internalStep = $null
[System.Xml.XmlElement] $displayWebsite = $null
[System.Xml.XmlElement] $networkFile = $null
[System.Xml.XmlElement] $urlFile = $null
[System.Xml.XmlElement] $runFile = $null
[System.Xml.XmlElement] $runRegistry = $null
[System.Xml.XmlElement] $mountIso = $null


################################################################
### PROCESS INPUT ##############################################
################################################################

if ($root.steps.HasChildNodes)
{
    foreach($step in $root.steps.ChildNodes)
    {
      ### Display description of the step
      write-host "`n`n"
      Write-Host $step.title -ForegroundColor red -BackgroundColor white
      Write-Host $step.description -ForegroundColor darkred -BackgroundColor white

      ### Request confirmation to execute the step
      $r = Get-Confirmation
      if ($r -eq 0) {
        foreach($internalStep in $step.internalSteps.ChildNodes)
        {
          ### Display websites
          foreach($displayWebsite in $internalStep.displayWebsites.ChildNodes)
          {
            start $displayWebsite.InnerText
          }

          ### Download network files
          foreach($networkFile in $internalStep.networkFiles.ChildNodes)
          {
            $fieldValue = $networkFile.InnerText
            Write-Host "$fieldValue : Downloading..."
            Copy-Item "$fieldValue" -Destination "$rootFolder"
            Write-Host "$fieldValue : Downloaded"
          }

          ### Download files from the Internet
          foreach($urlFile in $internalStep.urlFiles.ChildNodes)
          {
            $fieldValue = $urlFile.InnerText
            $outputFile = Split-Path $fieldValue -leaf
            Write-Host "$fieldValue : Downloading..."
            Invoke-WebRequest -Uri $fieldValue -OutFile $rootFolder\$outputFile
            Write-Host "$fieldValue : Downloaded"
          }

          ### Run files (.exe, .msi)
          foreach($runFile in $internalStep.runFiles.ChildNodes)
          {
             $fieldValue = $runFile.InnerText
             Start-Process -FilePath "$($rootFolder)\$($fieldValue)"
          }

          ### Run .reg files
          foreach($runRegistry in $internalStep.runRegistries.ChildNodes)
          {
              $fieldValue = $runRegistry.InnerText
              $StartParams = @{
                  FilePath = "$Env:SystemRoot\REGEDIT.exe"
                  ArgumentList = '/s',"$rootFolder\$fieldValue"
                  Verb = 'RunAs'
                  PassThru = $True
                  Wait = $True
              }
              $Proc = Start-Process @StartParams

              If ($Proc.ExitCode -eq 0) { Write-Host "$($fieldValue) successfully registered" }
              Else { Write-Host "$($fieldValue) failed! Exit code: $($Proc.ExitCode)" }
          }

          ### Mount iso as partitions
          foreach($mountIso in $internalStep.mountIsos.ChildNodes)
          {
              $fieldValue = $mountIso.InnerText
              Dismount-DiskImage -imagepath "$rootFolder\$fieldValue"
              $mountResult = Mount-DiskImage -imagepath "$rootFolder\$fieldValue" -PassThru
              $driveLetter = ($mountResult | Get-Volume).DriveLetter
              $newFolder = "$($rootFolder)\$($fieldValue)_dir"
              mkdir $newFolder
              xcopy /E /Y /H "${driveLetter}:\" $newFolder
          }
          Read-Host -Prompt "Press Enter to continue with next step"
        }
      }
    }
}

 Read-Host -Prompt "Finished. Press Enter to close"