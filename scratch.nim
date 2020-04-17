# Whilst the syntax of type classes appears to resemble that of ADTs/algebraic
# data types in ML-like languages, it should be understood that type classes
# are static constraints to be enforced at type instantations. Type classes are
# not really types in themsleves, but are instead a system of providing generic
# "checks" that ultimately resolve to some singular type. Type classes do not
# allow for runtime type dynamism, unlike object variants or methods.
#
# As an example, the following would not compile:

type Typeclass = int | string

var foo: TypeClass = 2
foo = "this will not compile"
