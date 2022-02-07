class Ping < FclRailsDaemon::Daemon

  # Is necessary to implement the method "initialize"
  def initialize
    # Set the parameter "command" (name that will be referenced in the command entered in the terminal)
    # The parameter "log" is optional but suggest it is set a log for each command to prevent many commands write on deafult log (if you have many commands in your application)
    # The parameter "process_name" is optional (is the name that will be assigned to the process)
    super(command: "ping", log: "log/ping.log", process_name: "ping")
  end

  # Is necessary to implement the method "self.help"
  def self.help
    # Should return a hash with " description" and "example"
    {
      description: "Pings a host. The interval is specified in the admin panel",
      sample: ["--command ping |start|stop|restart|status|"]
    }
  end

    # Is necessary to implement the method "run"
  def run
    # Call the run method of the parent class (super) through a block that will contain your code
    # You can optionally provide the parameter "loop" and "sleep" for the command to run repeatedly
    super(loop: true, sleep:10) do
      hosts = Host.all

      hosts.each {|host|
        if Time.now - host.lastcheck > host.interval
          if ping host.address
            host.failcount = 0
          else
            host.failcount = host.failcount + 1
          end
          host.lastcheck = Time.now
          host.save
        end
      }
    end
  end

  def ping host
    begin
      http = Net::HTTP.new(host,80)
      response = http.request_get('/')
      return response.code.to_i < 400
    rescue
      return false
    end
  end

end