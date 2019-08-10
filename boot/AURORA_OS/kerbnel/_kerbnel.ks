@lazyGlobal off.
local prefix to "AURORA_OS/kerbnel/".
local confPath to "AURORA_OS/" + SHIPNAME + ".conf".

local _libs to list(
  "_ev_loop",
  "_main_menu",
  "_inp",
  "_core_mgr"
).

global _store to lexicon().

function libLoader {
  for lib in _libs {
    runOncePath(prefix + lib).
  }
}

function _ {
  libLoader().
  _store:exp:showGui().
  startEVL().
}

_().