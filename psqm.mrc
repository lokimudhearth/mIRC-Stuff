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
