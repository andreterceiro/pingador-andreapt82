class AddFailcountToHosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :failcount, :int
  end
end
