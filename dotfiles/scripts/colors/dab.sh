#!/bin/sh
# by Him on the Arch boards
# ANSI Color -- use these variables to easily have different color
#    and format output. Make sure to output the reset sequence after 
#    colors (f = foreground, b = background), and use the 'off'
#    feature for anything you turn on.

initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI

cat << EOF

${c1}     c:;::x.                        
   ;...... ..;                     :'.
  :............'               ;..... 
  '...............         ,........ .
  '..................;;'........... .
  ; ........'.....    ........... .
   .....  ..'..       ...........
  ,.''.              .........'
 .     ...........    ..... .
.   ........... ..${c3},;,. ${c1}......
 ............ .'${c3}:oxxdc. ${c1}.... .
. ........ ..${c3};oxkkxxxdl' ${c1}.... '
 ;. ...  .,${c3}oOKXXNNXK0kxo'${c1}..... ,
   "'...;${c3}kXNNNNNNNNNNX0ko,. ${c1}....;
      "" ${c3}XNNNNNNNNNNNNNKOo'${c1}......:
         ${c3}XNNNNNNNNNNNNNNXOo' ${c1}.....l
        ${c3};0NNNNNNNNNNNNNNNN0o. ${c1}... .x
        ${c3},ONNNNNNNNNNNNNNNNNO:. ${c1}... 
EOF
