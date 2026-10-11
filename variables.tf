variable "security_findings_due_date_rules" {
  description = <<EOT
Map of security_findings_due_date_rules, attributes below
Required:
    - action
    - name
    - rule
Optional:
    - enabled
EOT

  type = map(object({
    action = object({
      due_days_per_severity = list(object({
        due_in_days = number
        severity    = string
      }))
      due_from           = string
      reason_description = optional(string)
    })
    name = string
    rule = object({
      finding_types = list(string)
      query         = optional(string)
    })
    enabled = optional(bool)
  }))
}

