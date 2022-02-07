class RenameSenhaToPassword < ActiveRecord::Migration[6.1]
  def change
    rename_column :usuarios, :senha, :password
  end
end
