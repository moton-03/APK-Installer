Set-Location (Split-Path $MyInvocation.MyCommand.Path -parent)
Add-Type -AssemblyName System.Windows.Forms;

$SetupVGPath = Join-Path -ChildPath ("Info") -Path (Get-Location)
$SetupVGPath = Join-Path -ChildPath ("APK-InstallerSetupVideoGuide.mp4") -Path ($SetupVGPath)


[void][System.Windows.Forms.MessageBox]::Show(@"
This program installs the APK program on this device.
To install the APK program, please continue.
"@)

[void][System.Windows.Forms.MessageBox]::Show(@"
-SetupGuide-
Make sure you've completed setup before continuing.
*Get Windows Subsystem for Android™ with Amazon Appstore from the link below. 
"https://apps.microsoft.com/store/detail/windows-subsystem-for-android%E2%84%A2-with-amazon-appstore/9P3395VX91NR?hl=en-us&gl=us"
*Open the Windows Sub System Settings for Android™ app.
*From the System tab, Change the subsystem resource to Continued.
*From the Developer tab, set Developer Mode to On.
*Remember the IP address in developer mode.
*Prepare the APK file and place it in a directory of your choice.
-Setup video guide-
The Setup video guide can be checked at "$SetupVGPath".
"@)

$Path = New-Inputbox -Prompt ("APK file path")

$IP = New-Inputbox -Prompt ("IP address")

[void][System.Windows.Forms.MessageBox]::Show(@"
You are ready to install the APK program.
To install the APK program, please continue.
"@)

Start-Process -FilePath ("install.bat") -ArgumentList ("$IP $Path")
[void][System.Windows.Forms.MessageBox]::Show(@"
do you want to continue
"@)

[void][System.Windows.Forms.MessageBox]::Show(@"
The installation is complete.
Apps can be launched from the All Apps list.
"@)