@lazyGlobal off.
SET TERMINAL:WIDTH to 80.
SET TERMINAL:HEIGHT to 64.

if not config:telnet {
  CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").
}
local scPath to scriptPath():parent.
runOncePath(scPath:combine("kerbnel","_str_lib")).
_setCPos(24).
clearScreen.

_pc("                          ...''...                          ").
_pc("    .';::::;,'...     .:dOKXNNNNXKkd:.                      ").
_pc("   'kNWMNOolc::;;;,;cxXWMMMMMMMMMMMMWXd,                    ").
_pc("   .oXMM0,        'kWMMMMMMMMMMMMMMMMMMXo.                  ").
_pc("     ,xXW0xkOkc. .kWMMMMMMMMMMMMMMMMMMMMWx.                 ").
_pc("       .oXMMMMWo.oWMMMMMMMMMMMMMMMMMMMMMMWo                 ").
_pc("        .oNMMMW0dONWMMMMMMMMMMMMMMMMMMMMMMKc'.              ").
_pc("          'clc:lxOKKKKXNWMMMMMMMMMMMMMMMMM0:,::;.           ").
_pc("                .oKK00O0K00KXNWWMMMMMMMMMNo   .;loc'        ").
_pc("                 :XWXKKKK0OOO0000O00XNWMWd.      'dKk:.     ").
_pc("                  cXMMMMWXKKKKK0OkkkOOOOd,.       ;0MW0:    ").
_pc("                   ,kNMMMMMMMWWNXKKKKKOxxkkkkxxxkOXWMMM0'   ").
_pc("                    .;d0NMMMMMMMMMMN0o'  ..,;clooddddol,    ").
_pc("                       .,codxxxxdoc,.                       ").
_pc(" ").
_pc("AURORA OS").

_setCPos(64).
_print("BOOTING...").
_pl("","","By Infini0520").

local V0 TO GetVoice(0).
SET V0:VOLUME to 0.9.
SET V0:RELEASE to 0.2.
SET V0:SUSTAIN to 0.5.
SET V0:WAVE to "SQUARE".
V0:PLAY( 
  LIST(
    NOTE( 1200, 0.1)
  )
).
wait 0.5.
stopAllVoices().
_cls().
wait 0.1.
runOncePath("AURORA_OS/kerbnel/_kerbnel").