require "rails_helper"
RSpec.describe Usuario do
  it "returns the content of the file who stores the salt" do
    # example code goes here - for more on the
    # code inside the examples, see rspec-expectations
    # and rspec-mocks
    content = File.open(Dir.pwd + "/config/salt.txt").read
    expect(content).to eq(Usuario.get_salt)
  end
end
