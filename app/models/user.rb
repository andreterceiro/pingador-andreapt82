class User < ApplicationRecord
    validates :login, :presence => true
    validates_uniqueness_of :login

    def self.get_salt
        file = File.open(Dir.pwd + "/config/salt.txt")
        return file.read
    end

    def self.verify_valid_active_value value 
        return (value == "0" or value == "1")
    end
end
