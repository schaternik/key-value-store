# frozen_string_literal: true

threads_count = ENV.fetch("THREADS_COUNT") { 4 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RACK_ENV") { "development" }
