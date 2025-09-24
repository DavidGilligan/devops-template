import time
import logging
from otel_bootstrap import init_tracer

# Initialise tracer
tracer = init_tracer(service_name="example-app")

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("example-app")


def work():
    with tracer.start_as_current_span("example-span"):
        logger.info("Doing some work...")
        time.sleep(1)


if __name__ == "__main__":
    while True:
        work()
