# デスクトップに Nutainx Cmdlets のショートカットを作成する。

$tool_name = "NtnxCmdlets"
$profile_script_name = "set_ntnx_prompt.ps1"

$shortcut_dir = Join-Path $HOME "Desktop"
$shortcut_path = Join-Path $shortcut_dir ($tool_name + ".lnk")

$tool_work_dir = (ls $PSCommandPath).DirectoryName
$profile_path = Join-Path $tool_work_dir $profile_script_name

$ps = "powershell"
$ps_argument = ("-NoExit", "-File",  $profile_path) -join " "

$wsh = New-Object -ComObject WScript.Shell
$shortcut = $wsh.CreateShortcut($shortcut_path)
$shortcut.TargetPath = $ps
$shortcut.Arguments = $ps_argument
$shortcut.WorkingDirectory = (ls $profile_path).DirectoryName
$shortcut.Save()
