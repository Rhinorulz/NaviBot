/*
Navibot V0.0.4 Twitch Edition
Start Legal (DO NOT REMOVE)
Navi Bot is Copyright Rhinorulz 2015
This code (Source) is released under GPL-3.0
Liscence viewable at http://opensource.org/licenses/GPL-3.0
end legal
start Info
http://twitch.tv/Navi_bot
http://hitbox.tv/Navibot
http://Minorleaguegaming.net
end info
*/
;Start Navi Bot
;
;Start Navi
;Annoy Commands
;Hey Listen
on *:connect:tmi.twitch.tv:{
  /JOIN(#rhinorulz,#scarletrever,#navi_bot)
}
on *:text:!Navi:#:{
  if (($($+(%,floodnavi.,$chan),2)) || ($($+(%,floodnavi.,$nick),2))) { return }
  set -u30 %floodnavi. $+ $chan On
  set -u300 %floodnavi. $+ $nick On
  msg $chan "Hey Listen!!!!"
}
;Hey
on *:text:!hey:#:{
  if (($($+(%,floodhey.,$chan),2)) || ($($+(%,floodhey.,$nick),2))) {return}
  set -u30 %floodhey. $+ $chan On
  set -u300 %floodhey. $+ $nick On
  msg $chan "Hey!"
}
;Listen
on *:text:!listen:#:{
  if (($($+(%,floodlisten.,$chan),2)) || ($($+(%,floodlisten.,$nick),2))) {return}
  set -u30 %floodlisten. $+ $chan On
  set -u300 %floodlisten. $+ $nick On
  msg $chan "Listen!"
}
;look
on *:text:!look:#:{
  if (($($+(%,floodlook.,$chan),2)) || ($($+(%,floodlook.,$nick),2))) {return}
  set -u30 %floodlook. $chan On
  set -u 300 %floodlook. $nick  On
  msg $chan "Look!"
}
;Watch Out
on *:text:!wo:#:{
  if (($($+(%,floodwo.,$chan),2)) || ($($+(%,floodwo.,$nick),2))) {return}
  set -u30 %floodwo. $+ $chan On
  set -u300 %floodwo. $+ $nick On
  msg $chan "Watch Out!"
}
;End Annoy Commands
;Test Commands
;ping
on *:text:!Ping:#: {
  if (($($+(%,floodping.,$chan),2)) || ($($+(%,floodping.,$nick),2))) {return}
  set -u30 %floodping. $+ $chan On
  set -u300 %floodping. $+ $chan On
  message $chan Pong
}
;begin Channel Commands
on *:JOIN:#: {
  if ($chan = #scarletrever ) {return}
  elseif $nick = Rhinorulz  msg $chan Welcome to our overloard $nick
  else msg $chan Welcome to the chanel $nick $+ .  We hope you enjoy your stay.
}

on *:PART:#:{
  if ($chan = #scarletrever ) {return}
  else msg $chan We wish $nick farewell.
}

;moderation start
;Test for ALL CAPS
on *:text:*:#:{
  if $isupper($1) {msg $chan $nick Please don't yell}
  msg $chan /timeout $nick 1 CAPS
}
;Song checker
;Really loud song that blows out speakers and deafens people
on *:text:*FBcZG1qiji4*:#:{
  msg $chan /ban $nick Bad Song
  msg $chan !delsong 14269479
}
;really sped up sonic theme that sounds aweful
on *:text:*tJqtmtIW7HU*:#:{
  msg $chan /ban $nick Bad Song
  msg $chan !delsong 14269871
}
