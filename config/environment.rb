require 'opentelemetry/sdk'
require 'opentelemetry/exporter/jaeger'

# Load the Rails application.
require_relative "application"

# https://opentelemetry.io/docs/languages/ruby/instrumentation/
OpenTelemetry::SDK.configure do |c|
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      OpenTelemetry::Exporter::Jaeger::AgentExporter.new(host: 'app-trace', port: 6831)
    )
  )
  # https://opentelemetry.io/docs/languages/ruby/libraries/#configuring-specific-instrumentation-libraries
  c.use 'OpenTelemetry::Instrumentation::Rails'
  c.use 'OpenTelemetry::Instrumentation::ActiveModelSerializers'
  c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
end

tracer = OpenTelemetry.tracer_provider.tracer('bookings', '0.1.0')

# Initialize the Rails application.
Rails.application.initialize!
