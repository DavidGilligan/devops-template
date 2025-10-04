---
name: Postmortem
about: Exported timeline and follow-up after an incident
title: "inc-DDMMYYYY-###: SHORT SUMMARY HERE"
labels: ["incident", etc.]
assignees:
  - oncall-devops
---

## Incident reference
- **Incident ID:** <!-- inc-DDMMYYYY-### -->
- **Date:** <!-- DD-MM-YYYY -->
- **Service(s):** <!-- name(s) -->
- **Severity:** <!-- Sev-1 | Sev-2 | Sev-3 -->
- **Duration:** <!-- HH:MM -->

## Summary
> Brief, non-technical description of what happened and who was impacted.

## Timeline
> This section should be pre-populated by the bot with joins/leaves, key messages, and alerts.  
> Fill in additional details as needed.

<!--- **T0:** alert fired "alert name" -->
<!--- - T+2m — channel created -->
<!--- - T+5m — rollback decision -->
<!--- - T+15m — customer note posted -->
<!--- - T+30m — mitigation confirmed -->
<!--- - T+45m — system stable -->
<!--- - T+50m — incident closed -->

## Root cause
- **Immediate trigger:** <!-- highlight the disruption -->
- **Contributing factors:** <!-- gaps in monitoring, process, infrastructure -->

## Resolution
- **Mitigation applied:** <!-- steps taken -->
- **Rollback/hotfix:** <!-- description -->
- **Final fix:** <!-- description -->

## Lessons learned
- **Successes:**  <!-- description -->
- **Failures:** <!-- description -->
- **Additional Comments:** <!-- description -->

## Action items
- [ ] Fix or mitigate root cause
- [ ] Add or tune alert / monitoring
- [ ] Improve or add automated tests
- [ ] Update runbook / documentation
- [ ] Verify rollback / restore procedure
- [ ] Schedule drill / game day
- [ ] Confirm service ownership
- **Owner:** <!-- name -->
- **Due:** <!-- DD-MM-YYYY -->

## Sign-off
- **Incident commander:** <!-- name -->
- **Reviewed by:** <!-- lead / manager -->
- **Follow-up owner confirmed:** <!-- name -->
- **Date:** <!-- DD-MM-YYYY -->