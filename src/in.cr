require "json"

class Version
  JSON.mapping(
    ref: String,
  )
end
class Payload
  JSON.mapping(
    version: Version,
  )
end

payload = Payload.from_json(STDIN)
puts payload.to_json
