class RenameAtivoToActive < ActiveRecord::Migration[6.1]
  def change
    rename_column :usuarios, :active, :active
  end
end
