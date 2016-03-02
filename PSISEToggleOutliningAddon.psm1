#requires -Version 4

<#
    Script:     ISEColapseAllFiles.ps1
    Author:     Matt Lavery
    Created:    02/03/2016
    Version:    0.0.1
    
    Change History
    Version    Who          When           What
    --------------------------------------------------------------------------------------------------
    0.0.1      MLavery      02/03/2016     Initial Coding
    
#>

<#  
    .SYNOPSIS
        Toggles the expand/collapse of all outlines in all open files within the ISE

    .DESCRIPTION
        Toggles the expand/collapse of all outlines in all open files within the ISE
        Works across PowerShell Tabs.
        Implements the keyboard shortcut CTRL+SHIFT+M and a menu item in the Add-ons menu.
#>
function Invoke-ISEToggleOutliningAllFiles
{
    [CmdletBinding()]
    Param()

    Foreach ($psISETab in $psISE.PowerShellTabs)
    {
        Write-Verbose "Processing files in PSTab: $($psISETab.DisplayName)";
        foreach ($psISEFile in $psISETab.Files)
        {
            Write-Verbose "Toggling PSFile: $($psISEFile.DisplayName)";
            $psISEFile.Editor.ToggleOutliningExpansion()
        }
    }
}



<#  
    .SYNOPSIS
        Installs the Add-on into the ISE to toggle the expand/collapse of all outlines in all open files within the ISE
#>
function Install-ISEToggleOutliningAddon
{
    [CmdletBinding()]
    Param()

    # set the properties of the menu
    $menuItemName = 'Toggle Colapse/Expand All Files';
    $menuItemKeys = 'CTRL+SHIFT+M';

    # remove the existing menu item if it exists
    Foreach ($psISETab in $psISE.PowerShellTabs)
    {
        Write-Verbose "PSTab: $($psISETab.DisplayName)";

        if ($psISETab.AddOnsMenu.Submenus.DisplayName.Contains($menuItemName))
        {
            $psISETab.AddOnsMenu.Submenus.Remove(($psISETab.AddOnsMenu.Submenus.GetEnumerator() | Where-Object DisplayName -EQ $menuItemName));
        }
        
        # add the add-on menu
        $psISETab.AddOnsMenu.Submenus.Add($menuItemName,{Invoke-ISEToggleOutliningAllFiles},$menuItemKeys) | Out-Null;
    }
}

