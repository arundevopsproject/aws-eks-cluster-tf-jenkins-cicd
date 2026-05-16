package docker

deny[msg] {

  input.Cmd[_] == "latest"

  msg := "latest image tag is not allowed"
}
