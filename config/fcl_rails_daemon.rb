# To register commands use the FclRailsDaemon::Recorder class
#  :command is the command name
#  :class_reference is the class to which it is
#
# FclRailsDaemon::Recorder.add(command: 'command_sample', class_reference: CommandSample)


FclRailsDaemon::Recorder.add(command: 'ping', class_reference: Ping)