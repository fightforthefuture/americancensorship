Sequel.migration do
  change do
    create_table(:posts) do
      primary_key :id
      String :name, :null => false
      String :email, :null => false
      Text :post, :null => false
    end
  end
end
