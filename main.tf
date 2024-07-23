# POLICY CREATION
resource "newrelic_alert_policy" "infra-alert" {
  name = "infra-alert"
  incident_preference = "PER_CONDITION" # PER_POLICY is default
}


resource "newrelic_alert_channel" "infra-notify" {
  name = "notify"
  type = "email"

  config {
    recipients              = "xshreya.sharma@gmail.com"
    include_json_attachment = "true"
  }
}

# CONDITION 
resource "newrelic_nrql_alert_condition" "infra-con1" {
  account_id                     = 4550857
  policy_id                      = newrelic_alert_policy.infra-alert.id
  name                           = "infra-con1"
  description                    = "Changes in Infrastructure"
  # runbook_url                    = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "last_value"
  # fill_value                     = 1.0
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = "FROM InfrastructureEvent SELECT count(*) WHERE changeType = 'added' AND format = 'inventoryChange' AND entityGuid = 'NDU1MDg1N3xJTkZSQXxOQXw3ODQxNTY5MjY0NDI5MzkxMzU5'"
  }

  critical {
    operator              = "above"
    threshold             = 5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}


#DESTINATION 
resource "newrelic_notification_destination" "infra-destinaiton" {
  account_id = 4550857
  name = "infra-destination"
  type = "EMAIL"

  property {
    key = "email"
    value = "xshreya.sharma@gmail.com"
  }
}


#CHANNEL 
resource "newrelic_notification_channel" "infra-channel" {
  account_id = 4550857
  name = "infra-channel"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.infra-destinaiton.id
  product = "IINT"

  property {
    key = "subject"
    value = "INFRA ALERT!"
  }

  property {
    key = "customDetailsEmail"
    value = "Changes in the Infrastructure"
  }
}

# WORKFLOW 
resource "newrelic_workflow" "infra-workflow" {
  name = "infra-workflow"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter"
    type = "FILTER"

    predicate {
      attribute = "priority"
      operator = "EXACTLY_MATCHES"
      values = [ "critical" ]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.infra-channel.id
  }
}

