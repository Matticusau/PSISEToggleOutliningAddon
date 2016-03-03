# PSISEToggleOutliningAddon
PowerShell Module to implement an Add-On for the ISE to toggle the expand/collapse of expandable sections in all open files

## Installation

To install the Add-on follow one of the following options:

### WMF 5.0
* Open PowerShell ISE
* Run the following commands
    * Install-Module -Name PSISEToggleOutliningAddon -Repository PSGallery;
    * Install-ISEToggleOutliningAddon
* Open multiple scripts with collapsible sections and press CTRL+SHIFT+M to see the add-on in use

### WMF 4.0
* Download the master branch of this repository
    * or browse to [PowerShellGallery.com](http://www.powershellgallery.com) and download PSISEToggleOutliningAddon
* Save the downloaded module to $HOME\Documents\WindowsPowerShell\Modules for the current user or C:\Program Files\WindowsPowerShell\Modules for all users
* Open the PowerShell ISE
* Run the following command to install the add-on
    * Install-ISEToggleOutliningAddon
* Open multiple scripts with collapsible sections and press CTRL+SHIFT+M to see the add-on in use

## Automate the registration of the Add-on at ISE Startup

To automatically install this add-on everytime the ISE is started use these steps:
* Follow one of the processes above to download and install the module
* Open the PowerShell ISE
* Edit your profile script with PSEDIT $profile
    * or manually open your profile script from $HOME\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1
* Add a line to the script to run 
    * Install-ISEToggleOutliningAddon
* Save your profile script
* Close and reopen the ISE

## Functions

* **Install-ISEToggleOutliningAddon** Installs the add-on into the ISE
* **Invoke-ISEToggleOutliningAllFiles** Used by the add-on menu/shortcut key to execute the functionality

### Install-ISEToggleOutliningAddon

This function is used to install the Add-on within the ISE. Add this to your profile script to automate this at start up.

### Invoke-ISEToggleOutliningAllFiles

This function is used to implement the functionality of the Add-on. From within the ISE when you use the menu item or keyboard shortcut keys this is the function that is called. You can call this function directly however this would defeat the purpose of the shortcut keys.

## Versions

### Unreleased

* None

### 1.0.0.0

* Initial release with following functionality
    * Add-on installation
    * Menu and Shortcut keys
    * Support for multiple PowerShell tabs and Files

## Contributing
If you are interested in contributing please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md). These are the standards I try and adopt for my work as well.

## License
This module is released under the [GNU General Public License 3.0](https://github.com/Matticusau/PSISEToggleOutliningAddon/blob/master/LICENSE)


