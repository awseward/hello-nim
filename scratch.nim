proc g[T](f: proc(x: T); x: T) = f x

proc c(y: int) = echo y
proc v(y: var int) =
  y += 100

var i: int

# allowed: infers 'T' to be of type 'int'
g(c, 42)

# not valid: 'T' is not inferred to be of type 'var int'
g(v, i)

# also not allowed: explict instantiation via 'var int'
g[var int](v, i)
