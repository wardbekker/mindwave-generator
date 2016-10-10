require 'socket'
require 'json'

server = TCPServer.open 2000
puts "Listening on port 2000"


loop {
  Thread.start(server.accept) do |client|
    loop {
      params = {
        timestamp: (Time.now.to_f * 1000).to_i, #milliseconds since epoch
        delta: rand(1..100),
        theta: rand(1..100),
        low_alpha: rand(1..100),
        high_alpha: rand(1..100),
        low_beta: rand(1..100),
        high_beta: rand(1..100),
        low_gamma: rand(1..100),
        mid_gamma: rand(1..100),
        attention: rand(1..100),
        meditation: rand(1..100)
      }
      
      client.puts params.to_json
      sleep 0.1
      
    }
  end
}
