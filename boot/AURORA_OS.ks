SET SHIPNAME to SHIP:NAME:replace(" ", "_").
SET CONFIGPATH to "0:/AOS_configs/" + SHIPNAME + ".conf".
if not EXISTS("AURORA_OS") {
  CREATEDIR("AURORA_OS").
}
COPYPATH("0:/boot/AURORA_OS/kerbnel/", "1:/AURORA_OS/").
COPYPATH("0:/boot/AURORA_OS/_boot", "1:/AURORA_OS/").
if EXISTS(CONFIGPATH) {
  COPYPATH(CONFIGPATH, "1:/AURORA_OS/").
}
runPath("1:/AURORA_OS/_boot").