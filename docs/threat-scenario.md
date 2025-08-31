Threat Scenarios & Security Controls

This project simulates common web application threats against a static S3-hosted website and demonstrates how AWS-native security services mitigate them.

1. Cross-Site Scripting (XSS) Injection




SCENARIO: An attacker attempts to inject malicious JavaScript into the application by appending payloads like: https://<cloudfront-domain>/?q=<script>alert(1)</script>

Expected Impact: Without protection, injected scripts could execute in users’ browsers, leading to credential theft or session hijacking.


MITIGATION:

AWS WAF managed rules block requests containing XSS payloads.


EVIDENCE:

cloudfront-403.png → 403 response

waf-blocked-xss.png → WAF console shows request blocked




2. SQL Injection (SQLi)

SCENARIO: An attacker appends SQL-like payloads in query parameters.

Expected Impact: If the backend was using a database, this could lead to data exfiltration or unauthorized modification.

MITIGATION:
AWS WAF managed rules (SQLiRuleSet) detect and block requests with SQL injection signatures.

EVIDENCE: WAF terminal screenshot (waf-blocked-xss.png also shows SQLi requests



3. Credential Compromise / Malicious API Calls

SCENARIO: A user’s IAM keys are leaked, and an attacker attempts reconnaissance (listing S3 buckets, scanning EC2, etc.).

Expected Impact: Unauthorized access to AWS resources.


Mitigation:

GuardDuty continuously monitors CloudTrail and VPC Flow Logs for unusual behavior.

Sample findings include:

Recon:EC2/PortProbeUnprotectedPort

UnauthorizedAccess:EC2/TorIPCaller

Evidence: guardduty-sample-finding.png



4. Denial of Service via High Request Volume

SCENARIO: An attacker floods the website with requests from a single IP.

Expected Impact: Increased costs, degraded availability.

MITIGATION:

WAF rate-based rule configured to block >1000 requests per IP within 5 minutes.

Evidence: WAF console showing blocked IP after threshold exceeded.




✅ Conclusion

This project demonstrates layered security in AWS:

Prevention with WAF (SQLi/XSS/DoS)

Detection with GuardDuty (recon, compromised credentials, anomalous behavior)

Infrastructure as Code ensures repeatability and auditability
