
when terminal:input:haschar then {
  local chr to terminal:input:getchar().
  // print "| chr [" + chr + "]" at(71, 6).
  
  if _inputs:haskey("anyOf") {
    if _inputs:keys:contains(chr) {
      _inputs:anyOf().
    }
  }
  if _inputs:haskey("any") {
    _inputs:any(chr).
  }
  if _inputs:hasKey(terminal:input:return) and chr = terminal:input:return {
    _inputs[terminal:input:return](chr).
  }
  if _recBuff {
    if chr = terminal:input:backspace {
      set _buff to _buff:substring(0, _buff:length - 1).
    } else {
      set _buff to _buff + chr.
    }
  } else {
    for k in _inputs:keys {
      if k <> "any" and k <> "else" and chr <> terminal:input:return {
        if chr = k {
          _inputs[k](chr).
        }
      }
    }
    
    if _inputs:haskey("else") {
      _inputs:else(chr).
    }
  }
  
  // print "|| chr [" + chr + "]" at(70, 7).
  // print "\\========" at(70, 8).
  return true.
}
// print "|| chr [ ]" at(70, 7).
// print "\\========" at(70, 8).
local _buff to "".
local _recBuff to false.

local _inputs to lexicon().

function registerInputs {
  parameter inputs.
  set _inputs to inputs.
}

function clearInputs {
  set _inputs to lexicon().
}

function input {
  parameter k, f.
  if _inputs:hasKey(k) {
    set _inputs[k] to f.
  } else {
    _inputs:add(k, f).
  }
}

function enableRecording {
  set _recBuff to true.
}

function lookupBuffer {
  return _buff.
}

function flushBuffer {
  local res to _buff:substring(0, _buff:length).
  set _buff to "".
  set _recBuff to false.
  return res.
}