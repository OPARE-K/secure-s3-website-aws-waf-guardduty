variable "project_name" {
  type    = string
  default = "secure-s3-site"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "enable_guardduty" {
  type    = bool
  default = true
}

variable "waf_enable_rate_limit" {
  type    = bool
  default = true
}

variable "rate_limit_requests" {
  type    = number
  default = 1000
}