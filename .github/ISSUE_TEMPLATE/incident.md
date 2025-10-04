---
name: INCIDENT NAME
about: One Alert, One ChanneL, One Ticket.
title: "inc-DDMMYYYY-###: SHORT SUMMARY HERE"
labels: ["incident", etc.]
assignees:
  - oncall-devops
---

## Summary
- **Service:** <!-- name -->
- **Severity:** <!-- Sev-1 | Sev-2 | Sev-3 -->
- **Start time:** <!-- DD-MM-YYYY HH:MM UTC+00:00 -->
- **Customer impact:** <!-- symptoms, scope, % users -->
- **Current status:** <!-- stabilising | degraded | resolved -->

## Roles
- **Incident commander:** <!-- name -->
- **Ops lead:** <!-- name -->
- **Comms lead:** <!-- name -->

## Links
- **Incident channel:** <!-- slack://... or teams://... -->
- **Dashboard:** <!-- link -->
- **Runbook:** <!-- link -->
- **Status page draft:** <!-- initial status message -->
- **Related alerts:** <!-- links -->

## Stabilisation and rollback
- **5 minute check due:** <!-- start time plus 5 minutes -->
- **Rollback decision:** <!-- proceed | not needed | already stable -->
- **Rollback executed:** <!-- yes/no, time, image tag -->
- **Previous stable image:** <!-- registry/ref -->

## Timeline
> Bot to append notes here, keep concise.

<!--- **T0:** alert fired "alert name" -->
<!--- **T+1m:** on-call paged automatically -->
<!--- **T+2m:** incident channel created -->
<!--- **T+3m:** roles assigned -->
<!--- **T+5m:** stability check in progress -->
<!--- **T+6m:** rollback/mitigation executed -->
<!--- **T+Xm:** customer status update posted -->
<!--- **T+Ym:** incident resolved -->

## Comms log
- **Internal updates cadence:** <!-- eg. every 15m -->
- **External updates cadence:** <!-- eg. every 30m for Sev-2 -->
- **Latest customer note:** <!-- paste or link -->

## Findings so far
- Suspected cause:
- Affected components:
- Mitigations tried:

## Action items
- [ ] Fix / mitigate root cause
- [ ] Add or adjust alert / monitoring
- [ ] Add or improve automated test coverage
- [ ] Update runbook / documentation
- [ ] Verify rollback / restore procedure
- [ ] Confirm ownership in service catalogue
- [ ] Schedule postmortem review (with due date)

## Post-incident
- [ ] Export timeline to postmortem on close

- **Follow up owner:** <!-- name -->
- **Due date:** <!-- YYYY-MM-DD -->
