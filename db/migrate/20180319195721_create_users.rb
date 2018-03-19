class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :login
      t.string :email
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps
    end
  end
end
