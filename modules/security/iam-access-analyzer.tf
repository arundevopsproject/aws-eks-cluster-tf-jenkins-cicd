# resource "aws_accessanalyzer_analyzer" "this" {

  analyzer_name = "${var.environment}-access-analyzer"

  type = "ACCOUNT"

  tags = local.common_tags
}

