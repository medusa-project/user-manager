class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :key, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :roles, :key, unique: true

    create_table :roles_users do |t|
      t.references :role, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
