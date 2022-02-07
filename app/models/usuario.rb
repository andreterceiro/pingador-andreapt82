class Usuario < ApplicationRecord
    validates :login, :presence => true
    validates_uniqueness_of :login
    validates_inclusion_of :active, :in => [0, 1]

    def self.get_salt
        file = File.open(Dir.pwd + "/config/salt.txt")
        return file.read
    end
end