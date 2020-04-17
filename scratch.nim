# bad style ahead: Nim is not C.
converter toBool(x: int): bool = x != 0

if 4:
  echo "compiles"
