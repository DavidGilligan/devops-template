---
name: Incident
about: One alert = one channel = one ticket
title: "inc-YYYYMMDD-###: <short summary>"
labels: ["incident"]
assignees: []
---

## Summary
- **Service:** <!-- name -->
- **Severity:** <!-- Sev-1 | Sev-2 | Sev-3 -->
- **Start time:** <!-- YYYY-MM-DD HH:MM UTC -->
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
- **Status page draft:** <!-- link -->
- **Related alerts:** <!-- links -->

## Stabilisation and rollback
- **5 minute check due:** <!-- time -->
- **Rollback decision:** <!-- proceed | not needed | already stable -->
- **Rollback executed:** <!-- yes/no, time, image tag -->
- **Previous stable image:** <!-- registry/ref -->

## Timeline
> The bot will append entries here. Keep messages brief and factual.

- T0 — alert fired: <!-- alert name -->
- T+1m — auto page sent to on-call
- T+2m — channel created: inc-YYYYMMDD-###
- T+3m — roles assigned: commander, ops, comms
- T+5m — stability check: <!-- stabilising? -->
- T+6m — action: <!-- rollback or mitigation -->
- T+?m — status update posted
- T+?m — resolved

## Comms log
- **Internal updates cadence:** <!-- eg. every 15m -->
- **External updates cadence:** <!-- eg. every 30m for Sev-2 -->
- **Latest customer note:** <!-- paste or link -->

## Findings so far
- Suspected cause:
- Affected components:
- Mitigations tried:

## Action items
- [ ] Add missing alert or threshold
- [ ] Improve runbook step:
- [ ] Test rollback path for this service
- [ ] Add ownership in service catalogue

## Post-incident
- [ ] Export timeline to postmortem on close
- **Follow up owner:** <!-- name -->
- **Due date:** <!-- YYYY-MM-DD -->
