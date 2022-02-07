class CommandSample < FclRailsDaemon::Daemon

  # Is necessary to implement the method "initialize"
  def initialize
    # Set the parameter "command" (name that will be referenced in the command entered in the terminal)
    # The parameter "log" is optional but suggest it is set a log for each command to prevent many commands write on deafult log (if you have many commands in your application)
    # The parameter "process_name" is optional (is the name that will be assigned to the process)
    super(command: "command_sample", log: "log/command_sample.log", process_name: "command_sample")
  end

  # Is necessary to implement the method "self.help"
  def self.help
    # Should return a hash with " description" and "example"
    {
      description: "This command is a sample, write here a valid description - Run every 10 seconds",
      sample: ["--command command_sample |start|stop|restart|status|"]
    }
  end

    # Is necessary to implement the method "run"
  def run
    # Call the run method of the parent class (super) through a block that will contain your code
    # You can optionally provide the parameter "loop" and "sleep" for the command to run repeatedly
    super(loop: true, sleep:10) do
      puts "Running "+ @command +" :)"
    end
  end

end
