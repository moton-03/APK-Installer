Clear-Host
Set-Location (Split-Path $MyInvocation.MyCommand.Path -parent)

$SetupVGPath = Join-Path -ChildPath ("Info") -Path (Get-Location)
$SetupVGPath = Join-Path -ChildPath ("APK-InstallerSetupVideoGuide.mp4") -Path ($SetupVGPath)


Write-Output -InputObject (@"
 ----------------------------------------------------------
|This program installs the APK program on this device.     |
|See "http://moton-03.github.io/APK-Installer" for details.|
|To install the APK program, please continue.              |
 ----------------------------------------------------------
"@)
Pause
Clear-Host

Write-Output -InputObject (@"
 -Setup Guide---------------------------------------------------------------------------------------------------------------------
|Make sure you've completed setup before continuing.                                                                              |
|*Get Windows Subsystem for Android™ with Amazon Appstore from the link below.                                                    | 
|"https://apps.microsoft.com/store/detail/windows-subsystem-for-android%E2%84%A2-with-amazon-appstore/9P3395VX91NR?hl=en-us&gl=us"|
|*Open the Windows Sub System Settings for Android™ app.                                                                          |
|*From the System tab, Change the subsystem resource to Continued.                                                                |
|*From the Developer tab, set Developer Mode to On.                                                                               |
|*Remember the IP address in developer mode.                                                                                      |
|*Prepare the APK file and place it in a directory of your choice.                                                                |
 ---------------------------------------------------------------------------------------------------------------------------------
 -Setup video guide-
The Setup video guide can be checked at "$SetupVGPath".
"@)
Pause
Clear-Host

$Path = Read-Host -Prompt ("APK file path")
Pause
Clear-Host

$IP = Read-Host -Prompt ("IP address")
Pause
Clear-Host

Write-Output -InputObject (@"
 --------------------------------------------
|You are ready to install the APK program.   |
|To install the APK program, please continue.|
 --------------------------------------------
"@)
Pause
Clear-Host

Start-Process -FilePath ("install.bat") -ArgumentList ("$IP $Path")
Pause
Clear-Host

Write-Output -InputObject (@"
 --------------------------------------------
|The installation is complete.               |
|Apps can be launched from the All Apps list.|
 --------------------------------------------
"@)
Pause
Clear-Host