$file = # Path to the local cpz file 
# e.g.   $file = "C:\MyApp\bin\Debug\SimplSharpProApp.cpz"
$fileLocationOnProcessor = # Path to the remote cpz file. Here you need to define the name of the cpz file on the processor.
# e.g.   $fileLocationOnProcessor = "\program01\VisualStudioDebugger.cpz"
$ip = # IP address of your processor 
# e.g.   $ip = "192.168.1.110"
$port = # The port that needs to be the same as Mono Debug Port! 
# e.g.   $port = "52000"
$slot = # Needs to be the same as the program where you are uploading your cpz file. If you are using program01, then it is a slot 1 
# e.g. $slot = 1
$username = # It is only required if you have an authentication on your processore. If you do not have, you can remove this parts of the code, as well as -Secure
# e.g. $username = "admin"
$password = # The same comment as at username

Send-FTPFile -Device $ip -LocalFile $file -RemoteFile $fileLocationOnProcessor -Secure -Username $username -Password $password
Invoke-CrestronCommand -Device $ip -Command "PROGLOAD -P:$($slot) -D" -Secure -Username $username -Password $password  -Prompt '>' -Timeout 40
Invoke-CrestronCommand -Device $ip -Command "DEBUGPROGRAM -P:$($slot) -Port:$port -IP:$ip -S" -Secure -Username $username -Password $password  -Prompt '>' -Timeout 30
Invoke-CrestronCommand -Device $ip -Command "PROGRESET -P:$($slot)" -Secure -Username $username -Password $password  -Prompt '>' -Timeout 30