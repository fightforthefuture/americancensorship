# Sets up DB tables for the censorship text.
DB.create_table :posts do
  primary_key :id, :unique => true
  Text :post_content
end
