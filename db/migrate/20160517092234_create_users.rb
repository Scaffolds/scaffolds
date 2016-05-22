class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.string :job_title
      t.string :image_url
      t.string :role

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
