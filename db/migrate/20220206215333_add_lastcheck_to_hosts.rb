class AddLastcheckToHosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hosts, :lastcheck, :timestamp
  end
end
