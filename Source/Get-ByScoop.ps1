function Get-ByScoop {
    param(
        [PSObject]$Item=$null
    )
    if($item.command -ne 'scoop') { throw ("Wrong method.  Expected 'scoop', received '{0}'" -f $item.command)}
    $command = (Get-Command $item.command).Source;
    if($command) {
        if($item.elevate){
            return Start-Process -Wait -Verb RunAs -FilePath $command -ArgumentList $parameters
        } else {
            return Start-Process -Wait -NoNewWindow -FilePath $command -ArgumentList $parameters
        }
    } else {
        throw ("No command matching {0} was found." -f $item.command);
    }
}