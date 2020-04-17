type
  Thing = ref object of RootObj
  Unit = ref object of Thing
    x: int

method m(a: Thing) {.base.} =
  echo "Thing"

method m(a: Unit) =
  # Call the base method:
  procCall m(a.Thing)
  echo "Unit: ", a.x

let u = new(Unit)
u.x = 19

u.m
