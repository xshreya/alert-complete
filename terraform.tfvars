recipient-email = "xshreya.sharma@gmail.com"

region-newrelic = "US"

policy_name = "infra-alert01x"

incident_preference = "PER_CONDITION"

condition_name =  "infra-con1"

con-desc = "Changes in Infrastructure"

enabled = true

violation_time_limit_seconds = 3600

fill_option = "last_value"

aggregation_window = 60

aggregation_method = "event_flow"

aggregation_delay = 120

expiration_duration = 120

open_violation_on_expiration   = true
close_violations_on_expiration = true
slide_by                       = 30

query = "FROM InfrastructureEvent SELECT count(*) WHERE changeType = 'added' AND format = 'inventoryChange' AND entityGuid = 'NDU1MDg1N3xJTkZSQXxOQXw3ODQxNTY5MjY0NDI5MzkxMzU5'"

crt_operator              = "above"
crt_threshold             = 5
crt_threshold_duration    = 300
crt_threshold_occurrences = "ALL"

war_operator              = "above"
war_threshold_occurrences = "ALL"
war_threshold             = 5
war_threshold_duration    = 300


dest_type = "EMAIL"
dest_prop_key = "email"
dest_name = "infra-destination"


chnl_name = "infra-channel"
chnl_type = "EMAIL"
chnl_product = "IINT"

chnl_subject_property_key = "subject"
chnl_subject_property = "INFRA ALERT!"

chnl_cusDetails_property_key = "custumDetailsEmail"
chnl_cusDetails_property =  "Changes in the Infrastructure"

workflow_name = "infra-workflow"
muting_rules_handling = "NOTIFY_ALL_ISSUES"
issue_filter_name = "filter"
issue_filter_type = "FILTER"

perdicate_attribute = "priority"
perdicate_operator = "EXACTLY_MATCHES"

perdicate_values = [ "critical" ]