securityhub = {
  source      = ["aws.securityhub"]
  detail-type = ["Security Hub Findings - Imported"],
  detail = {
    findings = {
      Compliance = {
        Status = ["PASSED"]
      },
      RecordState = ["ACTIVE"],
      Severity = {
        Label = ["CRITICAL"]
      }
    }
  }
}
