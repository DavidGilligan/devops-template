# Restore ClickHouse

1. Stop SigNoz services that depend on ClickHouse.
2. Restore data from object storage.
3. Start ClickHouse and dependants.
4. Validate in SigNoz.
5. Record outcome in postmortem if related to incident.
