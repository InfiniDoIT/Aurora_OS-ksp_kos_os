@lazyGlobal off.

local pwrs to lexicon().

function _cmgrGui {
  _updateGui({
    _setCPos(3).
    _pc("CORE STATUS","|","||",58, 22).
    _pc(EQ_SEPARATOR:substring(0,57),"|","",58, 23).
    _pCoresList().
    _pc(EQ_SEPARATOR:substring(0,57),"|","",58, 23).
  }).
}

function pRowH {
  parameter a to "",b to "",c to "",d to "".
  _pc(a,"|","|",20, 22). cUP().
  _pc(b,"","|",20, 42). cUP().
  _pc(c,"","|",6, 62). cUP().
  _pc(d,"","||",12, 68).
}

function pRow {
  parameter a to "",b to "",c to "", isCur to false.
  local _c to "".
  if isCur {
    set _c to " <- ".
  }
  _pl(a,"|","|",20, 22). cUP().
  _pl(b,"","|",20, 42). cUP().
  _pl(c,"","|",6, 62). cUP().
  _pc(_c,"","||",12, 68).
}

function _pCoresList {
  local pList to list().
  list processors in pList.
  pRowH("Name", "Volume", "Volt.", "Opt").
  local i to 0.
  for p in pList {
    _pCore(p, i).
    set i to i + 1.
  }

  until i = 8 {
    pRowH().
    set i to i + 1.
  }
}

function _pCore {
  parameter p, i.
  if p:tag = "" {
    set p:tag to "cpu " + i.
  }
  local resToTot to p:volume:capacity - p:volume:freespace + "/" + p:volume:capacity + "[B]".
  pRow(p:tag, resToTot, round(p:getField("kos average power"),2)).
}

function registerWatcher {
  parameter p.
  local old to round(p:getField("kos average power"),2).
  _waitFor({return old <> round(p:getField("kos average power"),2).}, {
    _cmgrGui().
    return true.
  }).
}

{
  local pList to list().
  list processors in pList.
  for p in pList {
    registerWatcher(p).
  }
}