"""
OpenTelemetry bootstrap module.
Initialises tracer provider and OTLP exporter.
"""

from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter


def init_tracer(service_name="example-app"):
    trace.set_tracer_provider(
        TracerProvider(resource={"service.name": service_name})
    )
    tracer_provider = trace.get_tracer_provider()

    exporter = OTLPSpanExporter(
        endpoint="http://otel-collector:4318/v1/traces",
        insecure=True,  # Traefik terminates TLS, Collector inside is plain HTTP
    )

    tracer_provider.add_span_processor(BatchSpanProcessor(exporter))
    return trace.get_tracer(__name__)
