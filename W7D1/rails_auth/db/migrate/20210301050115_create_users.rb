class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    options = { null: false, unique: true }
    create_table :users do |t|
      t.string :username, options
      t.string :password_digest, options
      t.string :session_token, options

      t.timestamps
    end
  end
end
