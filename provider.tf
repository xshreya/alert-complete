terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
        source = "newrelic/newrelic"
    }
  }
}

provider "newrelic" {
  account_id = 4550857
  api_key = "NRAK-Z9TBDCJ7HF22JKO463F3ZSB1KJD"
  region = "US"
}