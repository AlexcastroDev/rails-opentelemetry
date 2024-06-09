source "https://rubygems.org"

ruby '3.2.2'

gem "rails", "~> 7.1"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap"
gem "pg"

group :development do
  # Utils
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
  gem 'annotate'

  # OpenTelemetry
  gem 'jaeger-client'
  gem 'opentelemetry-sdk', '~> 1.4'
  gem 'opentelemetry-instrumentation-rails', '~> 0.30.1'
  gem 'opentelemetry-instrumentation-active_record', '~> 0.7.2'
  gem 'opentelemetry-instrumentation-active_model_serializers', '~> 0.20.1'
  gem 'opentelemetry-exporter-jaeger'
end
