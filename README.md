# Lightweight DevOps Template

This repository provides a reference implementation of a lightweight DevOps pipeline designed for small-scale software projects (SSPs). It was developed as part of an MSc dissertation at the University of Abertay. The template aims to minimise overhead and administrative burden while enabling repeatable CI, basic CD, and practical observability that non-specialist developers can adopt quickly.

## Project Overview

Conventional DevOps pipelines can be excessive for small projects, leading teams to rely on manual steps that slow delivery and increase risk. This template addresses that gap with a modular structure, a simple CI workflow, and an optional, containerised observability stack that can be started locally with a single command.

## Features

- Lightweight, reusable structure suitable for multiple small projects.
- CI via GitHub Actions (build/test on push and pull request).
- Optional local observability using Docker Compose (OpenTelemetry Collector and SigNoz).
- Example Python application instrumented for traces.
- Clear, editable YAML configuration files.
- No vendor lock-in: uses open standards and self-hostable components.

## Project Structure

devops-template/
├── .github/workflows/ci.yml                # GitHub Actions workflow
├── otel-config/collector-config.yaml       # OpenTelemetry Collector configuration
├── docker-compose.yml                      # Local SigNoz + Collector stack
├── setup.sh                                # One-command startup script
├── app/                                    # Example instrumented Python app
│   └── main.py
├── README.md
└── .gitignore

## Prerequisites

- Docker and Docker Compose installed locally (for observability stack).
- A GitHub account with Actions enabled (for CI).
- Python 3.10+ installed locally if you wish to run the example app.

## Quick Start

1) Clone the repository

   git clone https://github.com/DavidGillian/devops-template.git
   cd devops-template

2) Start the local observability stack (optional but recommended)

   ./setup.sh

   Once running, open SigNoz in a browser:
   http://localhost:3301

3) Run the example application to emit a sample trace

   python app/main.py

4) Push changes to trigger CI

   git add .
   git commit -m "Test CI"
   git push origin main

## Configuration

- OpenTelemetry Collector:
  - Edit otel-config/collector-config.yaml to change receivers, processors, and exporters.
  - Default configuration listens for OTLP on ports 4317 (gRPC) and 4318 (HTTP) and exports to ClickHouse via SigNoz.
- Docker Compose:
  - docker-compose.yml defines the local SigNoz and Collector services. Adjust ports or volumes if required.
- GitHub Actions:
  - .github/workflows/ci.yml defines a simple CI workflow. Extend with linting, tests, or build steps to suit your stack.

## Reusing the Template for a New Project

1) Use this repository as a template or copy the folder structure into your project.
2) Keep .github/workflows/ci.yml to retain CI on push/PR.
3) Keep docker-compose.yml and otel-config/collector-config.yaml if you want local observability.
4) Replace app/ with your application, adding minimal OpenTelemetry instrumentation where useful.
5) Update README.md and .gitignore to reflect your project needs.

## CI/CD Notes

- The default workflow checks out the code, sets up a runtime environment, installs dependencies for the example app, and runs a basic script.
- Extend the workflow to include unit tests, static analysis, packaging, or deployment steps as appropriate.
- If you wish to add deployment, keep it optional and environment-agnostic to preserve the template’s lightweight nature.

## Observability Notes

- The local stack is intended for development and demonstration. For production, host SigNoz securely or integrate with your organisation’s existing monitoring platform.
- Minimal tracing is demonstrated in app/main.py. You can add logging and metrics using OpenTelemetry SDKs for your language of choice.
- Keep instrumentation focused on key paths (e.g., request handling, critical jobs, external calls) to balance visibility and overhead.

## Troubleshooting

- Containers do not start:
  - Confirm Docker is running and that required ports (e.g., 3301, 4317, 4318, 9000) are available.
  - Run: docker compose logs -f to inspect service logs.
- No traces visible in SigNoz:
  - Check app instrumentation endpoint matches the Collector (localhost:4317 by default).
  - Verify the Collector is receiving data (check Collector logs).
- CI fails on GitHub:
  - Open the Actions tab to review logs. Ensure dependencies and runtime versions match your project.

## Research Context

This template supports an investigation into the viability of lightweight DevOps pipelines for SSPs, examining:
- Barriers to adopting DevOps in small teams.
- The trade-off between setup speed and functional coverage.
- The impact of a minimal, reusable pipeline on software quality and delivery pace.

## Contributing

Feedback and contributions are welcome. Please open an issue to discuss proposed changes or submit a pull request with clear rationale and testing notes.

## Licence

This project is released under the MIT Licence. See the LICENCE file for details.