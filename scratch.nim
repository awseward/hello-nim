template `!=` (a,b: untyped): untyped =
  # this definition exists in the System module
  not (a == b)

assert(5 != 6) # the compiler rewrites that to: assert(not (5 ==6))

assert(6 != 6) # won't compile

# The !=, >, >=, in, notin, isnot operators are in fact templates:

# a > b is transformed into b < a.
# a in b is transformed into contains(b, a).
# notin and isnot have the obvious meanings.

# The "types" of templates can be the symbols untyped, typed or typedesc. These
# are "meta types", they can only be used in certain contexts. Regular types
# can be used too; this implies that typed expressions are expected.
