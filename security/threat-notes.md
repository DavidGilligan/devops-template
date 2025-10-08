# Threat Notes

## Backup data compromise
- **Risk**: ClickHouse backups stored in S3 could leak if bucket is misconfigured.  
- **Mitigation**: Use unique S3 credentials, private buckets, and encryption at rest.  

## Dependency vulnerabilities
- **Risk**: Python/Node dependencies may contain CVEs.  
- **Mitigation**: Enable Dependabot or regular `pip install --upgrade`.  

## Secret leakage
- **Risk**: `.env` files or `acme.json` (TLS certs) committed by mistake.  
- **Mitigation**: Both are included in `.gitignore` and `.dockerignore`.  

## OTLP endpoint abuse
- **Risk**: OpenTelemetry endpoint (`:4317`/`:4318`) could be spammed with junk traces.  
- **Mitigation**: Limit by IP (`OTLP_ALLOWLIST`) or use authentication tokens.  

## Traefik dashboard exposure
- **Risk**: Traefik dashboard open to the internet without auth.  
- **Mitigation**: Enable `TRAEFIK_BASIC_AUTH`, or disable the dashboard in prod.  

