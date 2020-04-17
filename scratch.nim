proc onlyIntOrString[T: int|string](x, y: T) = discard

onlyIntOrString(123, 456)
# onlyIntOrString(1.0, true) #type mismatch
# onlyIntOrString("xy", 50) # invalid as 'T' cannot be both at the same time

# Would need sthng like this
proc hmm[T, U: int|string](x: T, y: U) = discard
hmm 123, 456
hmm "xy", 50
hmm 420, "yolo"
