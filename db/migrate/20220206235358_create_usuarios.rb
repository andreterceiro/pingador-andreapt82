class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :login
      t.string :senha
      t.integer :ativo

      t.timestamps
    end
  end
end
