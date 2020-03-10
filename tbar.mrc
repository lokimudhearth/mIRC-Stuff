on *:load: { 
  .echo -aq $input(Author: Protheus $+ $crlf $+ $crlf $+ Addon: Titlebar System $chr(40) $+ v1.0 $+ $chr(41) $+ $crlf $+ $crlf $+ Released on: 1/07/2017 $+ $crlf $+ $crlf $+ Contact: lokiisagod@live.com $+ $crlf $+ $crlf $+ Thank you for using this Addon,igo,Addon: Titlebar System $chr(40) $+ v1.0 $+ $chr(41))
  .echo -s _____________________________________________________
  .echo -s 0,1 Loading 9,1Titlebar System0,1 Add-On... 
  .echo -s 0,1 You are running mIRC $version on Windows $+ $os
  .echo -s ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
}
on *:unload: { 
  .echo -aq $input(Author: Protheus $+ $crlf $+ $crlf $+ Addon: Titlebar System $chr(40) $+ v1.0 $+ $chr(41) $+ $crlf $+ $crlf $+ Released on: 1/07/2017 $+ $crlf $+ $crlf $+ Contact: lokiisagod@live.com $+ $crlf $+ $crlf $+ Unloading...,igo,Addon: Titlebar System $chr(40) $+ v1.0 $+ $chr(41))
}

alias tbar {
  if ($dialog(tbar)) { dialog -x tbar }
  dialog -m tbar tbar
}

alias DCX_tbar {
}

dialog tbar {
  title ""
  size -1 -1 1600 1
  option dbu
}
on *:dialog:tbar:init:*: {
  dcx Mark $dname tbar_cb
  $blk
  $xdc 1 list 0 8 200 20 nosel
  xdid -f $dname 1 +a ansi 8 Verdana
  xdid -C $dname 1 +t $color(3) 
  xdid -C $dname 1 +b $color(1)
  xdid -a $dname 1 1 3{14- Server 14-3}9 $+($iif($scid($activecid).server,$scid($activecid).server,Not Connected))
  $xdc 2 list 235 8 200 20 nosel
  xdid -f $dname 2 +a ansi 8 Verdana
  xdid -C $dname 2 +t $color(3) 
  xdid -C $dname 2 +b $color(1)
  xdid -a $dname 2 1 3{14- $active 14-3}9 $chan($active).mode
  $xdc 3 list 480 8 200 20 nosel
  xdid -f $dname 3 +a ansi 8 Verdana
  xdid -C $dname 3 +t $color(3) 
  xdid -C $dname 3 +b $color(1)
  xdid -a $dname 3 1 3{14- Nickname 14-3}9 $nick
  $xdc 4 list 725 8 200 20 nosel
  xdid -f $dname 4 +a ansi 8 Verdana
  xdid -C $dname 4 +t $color(3) 
  xdid -C $dname 4 +b $color(1)
  xdid -a $dname 4 1 3{14- Usermodes 14-3}9 $usermode
  $xdc 5 list 962 8 226 20 nosel
  xdid -f $dname 5 +a ansi 8 Verdana
  xdid -C $dname 5 +t $color(3) 
  xdid -C $dname 5 +b $color(1)
  xdid -a $dname 5 1 3{14- Date 14-3}9 $day $+ , $date(mmmm dd yyyy) 
  xdock -m $dialog(tbar).hwnd +t
}

alias tbar_cb { }

on *:ACTIVE:*: {
  if ($dialog(tbar)) {
    xdid -o tbar 1 1 3{14- Server 14-3}9 $+($iif($scid($activecid).server,$scid($activecid).server,Not Connected))
    xdid -o tbar 2 1 3{14- $active 14-3}9 $chan($active).mode
    xdid -o tbar 3 1 3{14- Nickname 14-3}9 $nick
    xdid -o tbar 4 1 3{14- Usermodes 14-3}9 $usermode
    xdid -o tbar 5 1 3{14- Date 14-3}9 $day $+ , $date(mmmm dd yyyy)
  }
}
