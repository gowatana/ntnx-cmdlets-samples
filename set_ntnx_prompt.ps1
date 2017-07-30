Add-PSSnapin NutanixCmdletsPSSnapin

$window_width  = 150
$window_height = 50
$window_buffer = 3000

$pshost = Get-Host 
$pswindow = $pshost.ui.rawui

$pswindow.WindowTitle = "Nutanix Cmdlets"

$newsize = $pswindow.buffersize  
$newsize.height = $window_buffer 
$newsize.width = $window_width  
$pswindow.buffersize = $newsize  
  
$newsize = $pswindow.windowsize  
$newsize.height = $window_height  
$newsize.width = $window_width  
$pswindow.windowsize = $newsize

Get-NTNXCmdletsInfo

function prompt{
    if((Get-NTNXConnectionInfo).Count -gt 0){
        $prompt_color = "Green"
    }else{
        $prompt_color = "Gray"
    }
    
    Write-Host "NTNX" -NoNewLine -ForegroundColor "Gray"
    Write-Host ">" -NoNewLine -ForegroundColor $prompt_color
    return " "
}
