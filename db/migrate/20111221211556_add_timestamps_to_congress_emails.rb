class AddTimestampsToCongressEmails < ActiveRecord::Migration
  def change
    change_table :congress_emails do |t|
      t.timestamps
    end
  end
end
