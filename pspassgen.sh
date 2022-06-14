#$A = 1
#while ($A -le 50) {

write-host "generating strong password!" 
$pass = 2
while ($pass -eq 2) {

$count = $count + 1

#random character selecter
function Get-RandomCharacters($length, $characters) {
	$random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
	$private:ofs=""
	return [String]$characters[$random]
}

#random characters to select from (can change length to make password longer/shorter)
$password = Get-RandomCharacters -length 8 -characters 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&'

write-host $password

if (($password -match '[a-z]') -and ($password -match '[A-Z]') -and ($password -match '\d') -and ($password -match '[!,@,#,$.%.^.&]')) {
	$pass = 1
	write-host "match" -ForegroundColor green -BackgroundColor black
}else {
	$pass = 2 
	write-host "no match" -ForegroundColor yellow -BackgroundColor black
}

}

write-host "done, check passed!"
write-host "took $count tries"
write-host "password: $password" -ForegroundColor white -BackgroundColor black

#$A = $A + 1
#}
