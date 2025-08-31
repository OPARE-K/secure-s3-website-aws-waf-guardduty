provider "aws" {
  region = var.region
}

# Needed for CloudFront + WAF (scope=CLOUDFRONT)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
