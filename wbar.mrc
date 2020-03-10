##REQUIRES DCX.DLL##https://www.tg007.net/file-1713##

on *:START: { wbar }
alias wbar {
  if ($dialog(wbar)) { dialog -x wbar }
  dialog -m wbar wbar
  Unset %Linez.Wallopz
  /tbar
}

alias DCX_wbar {
}

dialog wbar {
  title ""
  size 2 2 1366 42
  option dbu
}

alias NWStart {
  .timer 1 0 xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ckb 0 0 $color(14) $color(1) Information $chr(9) +ck 0 0 $color(4) $color(1) STARTUP $chr(9) +ck 0 0 $color(3) $color(1) MiRC Started
  .timer 1 1 xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ckb 0 0 $color(14) $color(1) Information $chr(9) +ck 0 0 $color(4) $color(1) STARTUP $chr(9) +ck 0 0 $color(3) $color(1) Created by Protheus
  .timer 1 2 xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ckb 0 0 $color(14) $color(1) Information $chr(9) +ck 0 0 $color(4) $color(1) STARTUP $chr(9) +ck 0 0 $color(3) $color(1) Scripts Loaded $Script(0)
  .timer 1 3 xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ckb 0 0 $color(14) $color(1) Information $chr(9) +ck 0 0 $color(4) $color(1) STARTUP $chr(9) +ck 0 0 $color(3) $color(1) You are running mIRC version $version
  .timer 1 4 xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ckb 0 0 $color(14) $color(1) Information $chr(9) +ck 0 0 $color(4) $color(1) STARTUP $chr(9) +ck 0 0 $color(3) $color(1) Client running on Windows $os
  Set %Linez.Wallopz 5
}

on *:dialog:wbar:init:*: {
  dcx Mark $dname DCX_wbar
  xdialog -q $dname +r cross
  xdialog -c $dname 1 listview 0 0 1360 112 report fullrow grid
  xdid -t $dname 1 +c 0 80 Event Time $chr(9) +c 0 100 Server $chr(9) -l 0 100 Type $chr(9) +l 0 880 Message
  .timer 1 0 xdock -m $dialog($dname).hwnd +b
  .timer 1 1 NWStart
}
#SNote On
on *:SNOTICE:*: {
  xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ck 0 0 $color(14) $color(1) $server $chr(9) +ck 0 0 $color(11) $color(1) SNOTICE $chr(9) +ck 0 0 $color(3) $color(1) $2- | Inc %Linez.Wallopz | xdid -V wbar 1 %Linez.Wallopz 
}

on *:WALLOPS:*: { .xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ck 0 0 $color(14) $color(1) $server $chr(9) +ck 0 0 $color(11) $color(1) WALLOPS $chr(9) +ck 0 0 $color(3) $color(1) $1- | Inc %Linez.Wallopz | xdid -V wbar 1 %Linez.Wallopz }

on *:CONNECT: { .xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ck 0 0 $color(14) $color(1) $server $chr(9) +ck 0 0 $color(9) $color(1) Connection $chr(9) +ck 0 0 $color(11) $color(1) Connected to $server | Inc %Linez.Wallopz | xdid -V wbar 1 %Linez.wallopz }

On *:Text:*:*:{ 
  If ($Active != $Chan) {
    If ($me Isin $1-) || ($Regex($1-,Jon) >= 1) || ($Regex($1-,jon) >= 1) { .xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ck 0 0 $color(14) $color(1) $server $chr(9) +ck 0 0 $color(9) $color(1) NICKCALL $chr(9) +ck 0 0 $color(3) $color(1) $Nick Has Said Your Name On $Chan With Message $Strip($1-) | Inc %Linez.Wallopz | xdid -V wbar 1 %Linez.wallopz }
  }
}

On *:Action:*:*:{ 
  If ($Active != $Chan) {
    If ($me Isin $1-) || ($Regex($1-,Jon) >= 1) || ($Regex($1-,jon) >= 1) { .xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ck 0 0 $color(14) $color(1) $server $chr(9) +ck 0 0 $color(13) $color(1) NICKCALL $chr(9) +ck 0 0 $color(3) $color(1) $Nick Has Said Your Name On $Chan With Message $Strip($1-) | Inc %Linez.Wallopz | xdid -V wbar 1 %Linez.wallopz }
  }
}
on *:DISCONNECT: { .xdid -a wbar 1 0 0 +ck 0 0 0 0 $color(9) $color(1) $time(hh:nn:ss tt) $chr(9) +ck 0 0 $color(14) $color(1) $server $chr(9) +ck 0 0 $color(9) $color(1) Connection $chr(9) +ck 0 0 $color(14) $color(1) Disconnected from $server | Inc %Linez.Wallopz | xdid -V wbar 1 %Linez.Wallopz }
#Snote End
alias mdx { return DLL\mdx.dll }
alias moo { return DLL\moo.dll }
alias hos { return DLL\hos.dll }
alias views { return DLL\views.mdx }
alias bars { return DLL\bars.mdx }
alias custom { return DLL\mircustom.dll }
alias ctl { return DLL\ctl_gen.mdx }
alias dmdx { return DLL\dialog.mdx }
alias views { return DLL\views.mdx }
alias mdxin { dll $mdx SetMircVersion $version | dll $mdx MarkDialog $dname }
alias popupsd { return DLL\POPUPS.DLL }
alias de { return DLL\darkenginex.dll }
