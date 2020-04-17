# The bind statement is the counterpart to the mixin statement. It can be used
# to explicitly declare identifiers that should be bound early (i.e. the
# identifiers should be looked up in the scope of the template/generic
# definition):

# module A
var
  lastId = 0

template genId*: untyped =
  bind lastId
  inc lastId
  lastId

# module B
import A

echo genId()

# But a bind is rarely useful because symbol binding from the definition scope is the default.

# bind statements only make sense in templates and generics.
