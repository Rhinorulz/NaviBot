on :LOAD: { set %mIRCw <HTML><CENTER><FONT COLOR="blue"> My Home Page</FONT><BR>  <FONT COLOR="red">Hosted on mIRCw</FONT></CENTER></HTML> | /mIRCw.HELP }
on *:SOCKREAD:*mIRCw*: {
  sockread -f %temp
  if ($sockerr > 0) { return }
  if ($lines(mIRCwLOG.txt) == $null) { write -c mIRCwLOG.txt }
  write -a mIRCwLOG.txt %temp
}
on *:SOCKLISTEN:*mIRCw*: {
  set %sockname mIRCw. $+ $rand(1,50)
  sockaccept %sockname
  echo  -a Client connecting(mIRCw): Name: $sock(%sockname).name IP: $sock(%sockname).ip
  if ($sock(%sockname).ip == $read(mIRCwREF.txt,$sock(%sockname).ip)) { sockwrite -n %sockname <HTML><CENTER><FONT COLOR="RED' SIZE="30">Connection Refused: Your IP is listed in CONNECTION REFUSAL PROTOCOL</FONT></CENTER></HTML> | .timer 1 1 sockclose %sockname | echo -a 4Connection Killed:12 $sock(%sockname0.ip) was refused 1[IP Listed in mIRCw Refusal Protocol] | halt }
  sockwrite -n %sockname %mIRCw
  sockclose %sockname
  unset %sockname
}
alias mIRCw.HELP { echo -a mIRCw Commands: 12/mIRCw.SetHTML 1[Sets HTML] 12/mIRCw.OPEN 4or 12/mIRCw.CLOSE 1[Opens or Closes Server To Public] 12/mIRCw.GetIP 1[Looks up your IP(Your webpage will be http://<your ip>/] 12/mIRCw.REF 1[Opens Refusal TXT(Enter IP: Refuses specific IP from connection to your server)] 2{ Keep In Mind: mIRCw's Socket-based Web Server was tested on Microsoft Internet Explorer version 5.5 & 6.0. mIRCw may not work for any other browsers. Also: Remember you MUST use the <HTML></HTML> tags around your html code.] }
alias mIRCw.GetIP { dns $me | run ipconfig }
alias mIRCw.SetHTML { /set %mIRCw $1- }
alias mIRCw.OPEN { socklisten mIRCw 80 }
alias mIRCw.CLOSE { sockclose mIRCw | sockclose mIRCw.* }
alias mIRCw.REF {
  if ($lines(mIRCwREF.txt) == 0) { write -c mIRCwREF.txt | run mIRCwREF.txt }
  else { run mIRCwREF.txt }
}