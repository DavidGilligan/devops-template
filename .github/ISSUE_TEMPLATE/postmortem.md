---
name: Postmortem
about: Exported timeline and follow-up after an incident
title: "postmortem-YYYYMMDD-###: <incident summary>"
labels: ["postmortem"]
assignees: []
---

## Incident reference
- **Incident ID:** <!-- inc-YYYYMMDD-### -->
- **Date:** <!-- YYYY-MM-DD -->
- **Service(s):** <!-- name(s) -->
- **Severity:** <!-- Sev-1 | Sev-2 | Sev-3 -->
- **Duration:** <!-- HH:MM -->

## Summary
> Brief, non-technical description of what happened and who was impacted.

## Timeline
> This section should be pre-populated by the bot with joins/leaves, key messages, and alerts.  
> Fill in additional details as needed.

- T0 — alert fired
- T+2m — channel created
- T+5m — rollback decision
- T+15m — customer note posted
- T+30m — mitigation confirmed
- T+45m — system stable
- T+50m — incident closed

## Root cause
- **Immediate trigger:** <!-- what failed -->
- **Contributing factors:** <!-- gaps in monitoring, process, infra -->

## Resolution
- **Mitigation applied:** <!-- steps taken -->
- **Rollback/hotfix:** <!-- describe -->
- **Final fix:** <!-- describe -->

## Lessons learned
- What worked:
- What didn’t:
- Surprises:

## Action items
- [ ] Add or tune alert
- [ ] Update runbook
- [ ] Improve rollback testing
- [ ] Schedule drill
- **Owner:** <!-- name -->
- **Due:** <!-- YYYY-MM-DD -->

## Sign-off
- **Incident commander:** <!-- name -->
- **Reviewed by:** <!-- lead / manager -->
- **Date:** <!-- YYYY-MM-DD -->
