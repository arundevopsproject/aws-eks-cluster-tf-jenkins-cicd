package network.security

deny[msg] {

  input.kind == "NetworkPolicy"

  not input.spec.policyTypes

  msg := "NetworkPolicy must define policyTypes"
}
