@lazyGlobal off.

local _str to "".
local _cur_pos to 0.
local _properties to lexicon().
global WAVE_SEPARATOR to _str:padleft(TERMINAL:WIDTH):replace(" ", "~").
global EQ_SEPARATOR to WAVE_SEPARATOR:replace("~", "=").
global MIN_SEPARATORto to WAVE_SEPARATOR:replace("~", "-").

function _printCenter {
  parameter txt to "", leftSep to "", rightSep to "",lw to terminal:width, x to 0.
  local left to FLOOR((lw - (txt:length))/2).
  print "".
  print leftSep at(0+x,_cur_pos).
  print txt at(left+x,_cur_pos).
  print rightSep at((lw + x) - rightSep:length,_cur_pos).
  SET _cur_pos to _cur_pos + 1.
}

function _pc {
  parameter txt to "", leftSep to "", rightSep to "", lw to terminal:width, x to 0.
  _printCenter(txt, leftSep, rightSep, lw, x).
}

function _printLeft {
  parameter txt to "", leftSep to "", rightSep to "",lw to terminal:width, x to 0.
  print "".
  print leftSep + txt at(0 + x,_cur_pos).
  print rightSep at((lw + x) - rightSep:length,_cur_pos).
  SET _cur_pos to _cur_pos + 1.
}

function _pl {
  parameter txt to "", leftSep to "", rightSep to "", lw to terminal:width, x to 0.
  _printLeft(txt, leftSep, rightSep, lw, x).
}

function _print {
  parameter txt to "".
  print txt at(0,_cur_pos).
  SET _cur_pos to _cur_pos + 1.
}

function _uPrint {
  parameter txt to "", l to _cur_pos - 1.
  print txt at(0,l).
}

function _cls {
  clearScreen.
  SET _cur_pos to 0.
}

function _setCPos {
  parameter pos to 0.
  SET _cur_pos to pos.
}

function registerProperty {
  parameter name, line to _cur_pos, col to 0, value to "".
  _properties:add(name, lexicon("line", line, "col", col, "value", value)).
  print _properties[name]:value at(_properties[name]:col, _properties[name]:line).
}

function getProperty {
  parameter name.
  if _properties:haskey(name) {
    return _properties[name]:value.
  }
  return -9999.
}

function hasProperty {
  parameter name.
  return _properties:haskey(name).
}

function updateProperty {
  parameter name, value to "", line to _properties[name]:line, col to _properties[name]:col.
  set _properties[name]:value to value.
  set _properties[name]:line to line.
  set _properties[name]:col to col.
  print _properties[name]:value at(_properties[name]:col, _properties[name]:line).
}

function clearStore {
  set _properties to lexicon().
}

function getCurPos {
  return _cur_pos.
}

function cUP {
  SET _cur_pos to _cur_pos - 1.
}