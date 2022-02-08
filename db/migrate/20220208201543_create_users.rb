class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :active
      t.string :integer

      t.timestamps
    end
  end
end
