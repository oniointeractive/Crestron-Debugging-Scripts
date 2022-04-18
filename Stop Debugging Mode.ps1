$ip = # IP address of your processor 
# e.g.   $ip = "192.168.1.110"
$slot = # Needs to be the same as the program where you are uploading your cpz file. If you are using program01, then it is a slot 1 
# e.g. $slot = 1
$username = # It is only required if you have an authentication on your processore. If you do not have, you can remove this parts of the code, as well as -Secure
# e.g. $username = "admin"
$password = # The same comment as at username

Invoke-CrestronCommand -Device $ip -Command "STOPPROGRAM -P:$($slot)" -Secure -Username $username -Password $password -Prompt '>' -Timeout 60
Invoke-CrestronCommand -Device $ip -Command "DEBUGPROGRAM -P:$($slot) -C" -Secure -Username $username -Password $password -Prompt '>' -Timeout 60
Invoke-CrestronCommand -Device $ip -Command "PROGRESET -P:$($slot)" -Secure -Username $username -Password $password  -Prompt '>' -Timeout 20