data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.function_name}-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "main" {
  filename         = var.filename
  function_name    = var.function_name
  role             = aws_iam_role.lambda.arn
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  memory_size      = var.memory_size
  source_code_hash = var.source_code_hash

  environment {
    variables = var.environment_variables
  }

  vpc_config {
    subnet_ids         = var.vpc_config != null ? var.vpc_config.subnet_ids : null
    security_group_ids = var.vpc_config != null ? var.vpc_config.security_group_ids : null
  }

  depends_on = [aws_iam_role_policy_attachment.lambda_basic]

  tags = merge(var.tags, {
    Name = var.function_name
  })
}

resource "aws_lambda_permission" "allow_apigateway" {
  count         = var.create_api_gateway_permission ? 1 : 0
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_gateway_execution_arn}/*/*"
}
