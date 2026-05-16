package iam.security

deny[msg] {

  statement := input.Statement[_]

  statement.Effect == "Allow"

  statement.Action[_] == "*"

  statement.Resource == "*"

  msg := "IAM wildcard permissions are not allowed"
}
