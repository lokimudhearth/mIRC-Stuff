##REQUIRES DCX.DLL##https://www.tg007.net/file-1713##
##Throw these in Aliases##

dir.dll { return $shortfn($mircdir) $+ dll\ }
dcx { if ($isid) returnex $dll($dir.dll $+ dcx.dll,$1,$2-) | else dll " $+ $dir.dll $+ dcx.dll" $1 $2- }
udcx { if ($dcx(IsUnloadSafe)) $iif($menu, .timer 1 0) dll -u dcx.dll | else echo 4 -qmlbfti2 [DCX] Unable to Unload Dll. }
xdid { if ( $isid ) returnex $dcx( _xdid, $1 $2 $prop $3- ) | dcx xdid $2 $3 $1 $4- }
xdialog { if ( $isid ) returnex $dcx( _xdialog, $1 $prop $2- ) | dcx xdialog $2 $1 $3- }
xdock { if ($isid) returnex $dcx( _xdock, $1 $prop $2- ) | dcx xdock $1- }
xstatusbar { !if ($isid) returnex $dcx( _xstatusbar, mIRC $prop $1- ) |  dcx xstatusbar $1- }
xtreebar { !if ($isid) returnex $dcx( _xtreebar, mIRC $prop $1- ) | dcx xtreebar $1- }
xtray { if ($isid) returnex $dcx(TrayIcon, $1 $prop $2-) | dcx TrayIcon $1- }
xpop { if ( $isid ) returnex $dcx( _xpop, $1 $prop $2- ) | dcx xpop $2 $1 $3- }
xpopup { if ( $isid ) returnex $dcx( _xpopup, $1 $prop $2- ) | dcx xpopup $2 $1 $3- }
xmenubar { if ($isid) returnex $dcx(_xmenubar, $prop $1-) | dcx xmenubar $1- }
mpopup { dcx mpopup $1 $2 }
dcxml dcx dcxml $1-
tab {
  var %i = 1, %tab
  while (%i <= $0) {
    if ($eval($+($,%i),2) != $null) { %tab = $instok(%tab,$eval($+($,%i),2),$calc($numtok(%tab,9) + 1),9) }
    inc %i
  }
  return %tab
}
xdc return xdialog -c $dname
blk return xdialog -g $dname +b $rgb(0,0,0)

##Main Snippet##


#psqm on

alias psqm {
  if ($dialog(psqm)) { dialog -x psqm }
  dialog -m psqm psqm
}

dialog psqm {
  title "ProSec IRC Query Manager"
  size -1 -1 170 50
  option dbu
}

on *:dialog:psqm:init:*: {
  dcx Mark $dname psqm_cb
  $blk
  $xdc 1 text 4 4 332 20 transparent
  $xdc 2 text 4 22 332 20 transparent
  $xdc 4 button 4 70 82 26
  xdid -t $dname 4 Accept
  $xdc 5 button 130 70 82 26
  xdid -t $dname 5 Deny
  $xdc 6 button 254 70 82 26
  xdid -t $dname 6 Whois
}

alias psqm_cb {
  if ($2 == sclick) && ($3 == 4) {
    .query %qnick {- Query request accepted. -}
    dialog -x psqm
    unset %qnick
  }
  elseif ($2 == sclick) && ($3 == 5) {
    .query %qnick {- Query request denied. I am currently too busy to accept your PM. Please try again later. -}
    window -c  %qnick
    dialog -x psqm 
    .ignore -wu120 %qnick
    unset %qnick
  }
  elseif ($2 == sclick) && ($3 == 6) {
    whois %qnick
  }
}

on *:open:?:*: {
  set %qnick $nick
  .query %qnick {- Your query has been sent. Please be patient while i decide whether or not to respond... -}
  echo -a Incoming Message From: $nick $+ ( $+ $address $+ )
  psqm
  xdid -t psqm 1 {- Sender: $nick -}
  xdid -t psqm 2 {- Time: $time(h:nn TT) -}
}

#psqm end

menu channel {
  .Query Manager
  ..On: .enable #psqm | echo -a Query Manager on
  ..Off: .disable #psqm | echo -a Query Manager off
}
