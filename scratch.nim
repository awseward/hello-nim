proc `==`(x, y: ptr int): bool {.error.}

const foo = "ayyy"

{.warning: "yup " & foo.}
