# Lower the Priority of OneDrive Overlay Icons

## Overview
Only 15 overlay icons can be used on Windows.  
Although OneDrive sometimes modify registry keys to avoid the limitations by raising priority of OneDrive overlay icons, it often causes troubles of displaying overlay icons of other applications like GoogleDrive.

Scripts in this repository solves such troubles by lowering priority of OneDrive overlay icons.  
Please be careful the scripts may cause some troubles to display overlay icons of OneDrive.

## Useage
1. Run PowerShell as an Administrator
1. Move working directory to `Lower-PriorityOfOdIcons.ps1` stored.
1. Run `.\Lower-PriorityOfOdIcons.ps1`

## Example
```PowerShell
PS> cd $Env:USERPROFILE\Downloads\
PS> .\Lower-PriorityOfOdIcons.ps1
```

## CAUTION
Please backup your registry keys before running scripts.  We take no responsibility at all.