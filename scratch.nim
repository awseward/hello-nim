# module 'm'

type
  Lev = enum levA, levB

var abclev = levB

template tstLev(abclev: Lev) =
  echo abclev, "", m.abclev

tstLev(levA)
