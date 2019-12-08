# Runs every time a package is installed in a project

param($installPath, $toolsPath, $package, $project)

function SetFileProperties
{
    foreach ($file in $args[0])
    {
        SetOutputAction $project.ProjectItems.Item($file) 2
    }
}

function SetOutputAction([__ComObject]$item, [int]$buildAction)
{

    $item.Properties.Item("CopyToOutputDirectory").Value = $buildAction
	Write-Host " Setting Output action to $($item.Properties.Item("CopyToOutputDirectory").Value) for $($item.Name)"
}

[string[]] $files = @("geckodriver.exe")

SetFileProperties $files

