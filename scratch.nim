proc create*[T](): ref T =
  # there is no overloaded 'init' here, so we need to state that it's an
  # open symbol explicitly:
  mixin init
  new result
  init result
