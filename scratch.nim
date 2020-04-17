type
  LoadError* = object of Exception

raise newException(LoadError, "Failed to load data")
