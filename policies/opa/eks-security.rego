package eks.security

deny[msg] {

  input.kind == "Pod"

  container := input.spec.containers[_]

  container.securityContext.privileged == true

  msg := sprintf(
    "Privileged containers are not allowed: %v",
    [container.name]
  )
}
