@lazyGlobal off.

local _evLoop to list().
local _evLoopT to list().
local _guiLoop to queue().

local _clrEvList to list().

function _updateGUI {
  parameter drawFunc.
  _guiLoop:push(drawFunc).
}

function _addEvent {
  parameter ev.
  _evLoopT:add(ev).
}

function _waitFor {
  parameter cc, ev.
  local evCaller to {
    local res to ev().
    if res {
      _waitFor(cc, ev).
    }
    return false.
  }.
  local condChecker to {
    if cc() {
      _addEvent(evCaller).
      return false.
    }
    return true.
  }.
  _addEvent(condChecker).
}

function startEVL {
  until false {
    // print "|EVL STATS" at(70, 3).
    // print "|| MVL [x]" at(70, 4).
    local it to _evLoop:iterator.
    it:next().
    // wait 0.1.
    // print "|| MVL [ ]" at(70, 4).
    until it:atend {
      // print "|| EVL [x]" at(70, 5).
      local func to it:value.
      local res to func().
      // print res at(75,9).
      if res {
        _addEvent(func).
      }
      // print "|| lgh " + _evLoop:length at(70, 10).

      it:next().
    }
    // print "|| EVL [ ]" at(70, 5).
    until _guiLoop:length = 0 {
      // print "|| GVL [x]" at(70, 6).
      _guiLoop:pop()().
    }
    // print "|| GVL [ ]" at(70, 6).
    set _evLoop to _evLoopT:copy().
    _evLoopT:clear().
    // wait 0.1.
  }
}.