
## On-call and escalation
- Single engineer is on call per week.
- Escalate Sev-1 incidents to the team lead immediately.
- Rotation is tracked in the shared calendar.

## Incident response
- Roles: Incident Commander, Ops Lead, Comms Lead.
- Apply the 5-minute rollback rule: rollback if not stabilised by T+5.
- Hotfixes are only applied after stability is confirmed.

## Communication
- Severity 1: Internal updates every 15m, external every 30m.
- Severity 2: Internal updates every 30m, external hourly.
- Severity 3: Hourly updates internal only.

## Access control
- Only maintainers can deploy or rollback via GitHub Actions.
- Developers may run CI but not production deployments.

## Drills
- Monthly chaos test: simulate a Sev-2 incident.
- Verify rollback procedure and comms cadence.
- Record outcomes in postmortems.