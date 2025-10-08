"""
OpenTelemetry bootstrap module.
Initialises tracer provider and OTLP exporter.
"""

import os

from opentelemetry import trace
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter


def init_tracer(service_name: str = "example-app"):
    # Build a proper Resource
    resource = Resource.create({"service.name": service_name})

    # Set the tracer provider
    provider = TracerProvider(resource=resource)
    trace.set_tracer_provider(provider)

    # OTLP over HTTP - no 'insecure' flag, include /v1/traces
    endpoint = os.getenv("OTEL_EXPORTER_OTLP_ENDPOINT", "http://otel-collector:4318")
    exporter = OTLPSpanExporter(endpoint=f"{endpoint.rstrip('/')}/v1/traces")

    # Batch processor for efficiency
    provider.add_span_processor(BatchSpanProcessor(exporter))

    return trace.get_tracer(service_name)
