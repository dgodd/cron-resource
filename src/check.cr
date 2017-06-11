require "cron_parser"
require "json"

class Source
  JSON.mapping(
    expression: String,
    location: {type: String, default: "UTC"},
  )
end
class Payload
  JSON.mapping(
    source: Source,
  )
end

source = Payload.from_json(STDIN).source
ENV["TZ"] = source.location
cron_parser = CronParser.new(source.expression)
ref = cron_parser.last(Time.now).to_s("%Y-%m-%d %H:%M:%S %z")
puts [{ ref: ref }].to_json
