# POLICY CREATION
resource "newrelic_alert_policy" "infra-alert" {
  name = var.policy_name
  incident_preference = var.incident_preference # PER_POLICY is default
}


# CONDITION 
resource "newrelic_nrql_alert_condition" "infra-con1" {
  account_id                     = var.nr_account_id
  policy_id                      = newrelic_alert_policy.infra-alert.id
  name                           = var.condition_name
  description                    = var.con-desc
  # runbook_url                    = "https://www.example.com"
  enabled                        = var.enabled
  violation_time_limit_seconds   = var.violation_time_limit_seconds
  fill_option                    = var.fill_option
  # fill_value                     = 1.0
  aggregation_window             = var.aggregation_window
  aggregation_method             = var.aggregation_method
  aggregation_delay              = var.aggregation_delay
  expiration_duration            = var.expiration_duration
  open_violation_on_expiration   = var.open_violation_on_expiration
  close_violations_on_expiration = var.close_violations_on_expiration
  slide_by                       = var.slide_by

  nrql {
    query = var.query
  }

  critical {
    operator              = var.crt_operator
    threshold             = var.crt_threshold
    threshold_duration    = var.crt_threshold_duration
    threshold_occurrences = var.crt_threshold_occurrences
  }

  warning {
    operator              = var.war_operator
    threshold             = var.war_threshold
    threshold_duration    = var.war_threshold_duration
    threshold_occurrences = var.war_threshold_occurrences
  }
}


#DESTINATION 
resource "newrelic_notification_destination" "infra-destinaiton" {
  account_id = var.nr_account_id
  name = var.dest_name
  type = var.dest_type

  property {
    key = var.dest_prop_key
    value = var.recipient-email
  }
}


#CHANNEL 
resource "newrelic_notification_channel" "infra-channel" {
  account_id = var.nr_account_id
  name = var.chnl_name
  type = var.chnl_type
  destination_id = newrelic_notification_destination.infra-destinaiton.id
  product = var.chnl_product

  property {
    key = var.chnl_subject_property
    value = var.chnl_subject_property
  }

  property {
    key = var.chnl_cusDetails_property_key
    value = var.chnl_cusDetails_property
  }
}

# WORKFLOW 
resource "newrelic_workflow" "infra-workflow" {
  name = var.workflow_name
  muting_rules_handling = var.muting_rules_handling

  issues_filter {
    name = var.issue_filter_name
    type = var.issue_filter_type

    predicate {
      attribute = var.perdicate_attribute
      operator = var.perdicate_operator
      values = var.perdicate_values
    }
  }

  destination {
    channel_id = newrelic_notification_channel.infra-channel.id
  }
}

