require 'jaeger/client'

Jaeger::Client.build(
  service_name: 'bookings',
  host: 'app-trace',
  port: 6831
)
