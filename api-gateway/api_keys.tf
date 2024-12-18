resource "aws_api_gateway_api_key" "zenardi" {
  name    = "Eduardo Zenardi"
  enabled = true
}

resource "aws_api_gateway_usage_plan" "zenardi" {
  name = "Health-API: zenardi Usage Plan"

  throttle_settings {
    burst_limit = 10
    rate_limit  = 1
  }

  quota_settings {
    limit  = 100000
    period = "MONTH"
  }

  api_stages {
    api_id = aws_api_gateway_rest_api.health_api.id
    stage  = aws_api_gateway_stage.health_api.stage_name
  }

}

resource "aws_api_gateway_usage_plan_key" "zenardi" {
  key_id        = aws_api_gateway_api_key.zenardi.id
  usage_plan_id = aws_api_gateway_usage_plan.zenardi.id
  key_type      = "API_KEY"
}