class CreateCongressEmail < ActiveRecord::Migration
  def up
    create_table :congress_emails do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :zip
      t.text :letter
    end
  end

  def down
    drop_table :congress_emails
  end
end
