variable "policy_name" {
  description = "policy name"
  type = string
}

variable "recipient-email" {
  description = "email of the recipient of alert"
  type = string
}

variable "region-newrelic" {
  description = "newrelic region"
  type = string
}

variable "nr_account_id" {
  description = "New Relic Account ID"
  type        = number
}

variable "nr_api_key" {
  description = "New Relic API Key"
  type        = string
}

variable "incident_preference" {
  type = string
}

variable "condition_name" {
  type = string
}

variable "con-desc" {
  type = string
  description = "condition description"
}

variable "enabled" {
  type = bool
}

variable "violation_time_limit_seconds" {
  type = number
}

variable "fill_option" {
  type = string
}

variable "aggregation_window" {
  type = number
}

variable "aggregation_method" {
  type = string
}

variable "aggregation_delay" {
  type = number
}

variable "expiration_duration" {
  type = number
}

variable "open_violation_on_expiration" {
  type = bool
}


variable "close_violations_on_expiration" {
  type = bool 
}

variable "slide_by" {
  type = number
}

variable "query" {
  type = string
}

variable "crt_operator" {
  description = "Operator for critical alerts"
  type        = string
}

variable "crt_threshold" {
  description = "Threshold for critical alerts"
  type        = number
}

variable "crt_threshold_duration" {
  description = "Duration for critical alerts threshold"
  type        = number
}

variable "crt_threshold_occurrences" {
  description = "Occurrences for critical alerts threshold"
  type        = string
}

variable "war_operator" {
  description = "Operator for warning alerts"
  type        = string
}

variable "war_threshold_occurrences" {
  description = "Occurrences for warning alerts threshold"
  type        = string
}

variable "war_threshold" {
  description = "Threshold for warning alerts"
  type        = number
}

variable "war_threshold_duration" {
  description = "Duration for warning alerts threshold"
  type        = number
}

variable "dest_name" {
  type = string
}

variable "dest_type" {
  type = string
}

variable "dest_prop_key" {
  type = string
}

variable "chnl_name" {
  type = string
}

variable "chnl_type" {
  type = string
}

variable "chnl_product" {
  type = string
}

variable "chnl_subject_property" {
  type = string
}

variable "chnl_cusDetails_property" {
  type = string
}

variable "workflow_name" {
  type = string
}

variable "muting_rules_handling" {
  type = string
}

variable "issue_filter_name" {
  type = string
}

variable "issue_filter_type" {
  type = string
}

variable "perdicate_attribute" {
  type = string
}

variable "perdicate_operator" {
  type = string
}

variable "perdicate_values" {
  type = list(string)
}


variable "chnl_cusDetails_property_key" {
  type = string
}

variable "chnl_subject_property_key" {
  type = string
}