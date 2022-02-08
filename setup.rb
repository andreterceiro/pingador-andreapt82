#!/usr/bin/env ruby
# setup
ENV['RAILS_ENV'] = ARGV[0] || 'development'
require File.expand_path('../config/environment',  __FILE__)
salt = ""
login = ""
password = ""

# asking for the salt
if File.exist?("./config/salt.txt")
    puts "We already have a config/salt.txt. We do not try to create it"
else
    while salt.empty?
        puts "Please insert the salt. I will save it in config/salt.txt outside of Git:"
        salt = gets.chomp
    end

# Saving the salt
    File.open("./config/salt.txt", "w") do |f|     
        f.write(salt)   
    end
end

# Asking for a user
puts "Cool. Now please enter some data about the user:"

while login.empty?
    puts "login:"
    login = gets.chomp
end

while password.empty?
    puts "Password"
    password = gets.chomp
end

# Saving the user
previous_user = User.find_by_login(login)
if previous_user.nil?
    user = User.new
    user.login = login
    user.password = Digest::MD5.hexdigest(password + User.get_salt)
    user.active = 1
    user.save
    puts "Success in save a user"
else
    puts "We already has a user with this login. We did not create a new user."
end

# The end
puts "Thanks! Now run \"rails server\" to see the project."