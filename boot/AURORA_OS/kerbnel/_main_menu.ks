@lazyGlobal off.

local _explorer to lexicon(
  "showGui", {
    _store:exp:refreshGui().
    _installInputs().
  },
  "refreshGui", {
    _updateGui({
      _setCPos(0).
      _print(EQ_SEPARATOR).
      _pc("AURORA OS","||","||").
      _print(EQ_SEPARATOR).
      _print("||  Choose function   |").
      _print("||====================|").
      _pFuncs().
      _print("||====================|").
      _cmgrGui().
    }).
  },
  "_cID", 0
).

local _opt to lexicon(
  "reboot", {reboot.},
  "shutdown", {shutdown.},
  "", {},
  " ", {},
  "  ", {},
  "   ", {},
  "    ", {},
  "     ", {},
  "      ", {}
).

local _stats to lexicon(
  "0", 0,
  "1", 0,
  "_scs", 0
).

function check {
  parameter stat.
  return choose "x" if stat else " ".
}

local _pFuncs to {
  local _op to 0.
  for f in _opt:keys {
    local pref to "||    ".
    if _op = _store:exp:_cID {
      set pref to "|| -> ".
    }
    local tf to f:padright(16) + "|".
    _pl(tf,pref,"").
    if tf:contains("[ ]") or tf:contains("[x]") {
      print check(_stats[_stats:keys[_op]]) at(20,_op + 5).
    } 
    set _op to _op + 1.
  }
}.

local _installInputs to {
  local lex to lexicon(
    terminal:input:upcursorone, {
      parameter c.
      local cid to _store:exp:_cID.
      if cid > 0 {
        set _store:exp:_cID to cid - 1.
      }
    },
    terminal:input:downcursorone, {
      parameter c.
      local cid to _store:exp:_cID.
      if cid < _opt:length - 1 {
        set _store:exp:_cID to cid + 1.
      }
    },
    terminal:input:return, {
      parameter c.
      _addEvent({
        _opt[_opt:keys[_store:exp:_cID]]().
        _store:exp:refreshGui().
      }).
    },
    "anyOf", {
      _store:exp:refreshGui().
    }
  ).
  registerInputs(lex).
}.

{
  _store:add("exp",_explorer).
}